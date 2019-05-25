module HonorBoard
  module V1
    class AccomplishmentsAPI < Grape::API
      # GET /accomplishments/:id
      desc 'Show requested accomplishment details'

      params do
        requires :id, type: String
      end

      get '/accomplishments/:id' do
        accomplishment = Accomplishment.find(params[:id])

        present :accomplishment, accomplishment, with: ::V1::AccomplishmentEntity
      end

      # POST /accomplishments/
      desc 'Create accomplishment'

      params do
        requires :accomplishment, type: Hash do
          requires :participation_id, type: String
          requires :achievement_id, type: String
        end
      end

      post '/accomplishments' do
        accomplishment = Accomplishment.new(declared(params)[:accomplishment])

        if accomplishment.save
          present :accomplishment, accomplishment, with: ::V1::AccomplishmentEntity
        else
          error!({ errors: accomplishment.errors.messages }, :unprocessable_entity)
        end
      end

      # DELETE /accomplishment/:id
      desc 'Destroy requested accomplishment'

      params do
        requires :id, type: String
      end

      delete '/accomplishments/:id' do
        accomplishment = Accomplishment.find(params[:id])

        if accomplishment.destroy
          status :no_content
        else
          error!({ errors: accomplishment.errors.messages }, :conflict)
        end
      end
    end
  end
end
