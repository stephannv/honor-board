module HonorBoard
  module V1
    class ParticipationsAPI < Grape::API
      # GET /participations/:id
      desc 'Show requested participation details'

      params do
        requires :id, type: String
      end

      get '/participations/:id' do
        participation = Participation.find(params[:id])

        present :participation, participation, with: ::V1::ParticipationEntity
      end

      # POST /participations/
      desc 'Create participation'

      params do
        requires :participation, type: Hash do
          requires :season_id, type: String
          requires :participant_id, type: String
        end
      end

      post '/participations' do
        participation = Participation.new(declared(params)[:participation])

        if participation.save
          present :participation, participation, with: ::V1::ParticipationEntity
        else
          error!({ errors: participation.errors.messages }, :unprocessable_entity)
        end
      end

      # DELETE /participation/:id
      desc 'Destroy requested participation'

      params do
        requires :id, type: String
      end

      delete '/participations/:id' do
        participation = Participation.find(params[:id])

        if participation.destroy
          status :no_content
        else
          error!({ errors: participation.errors.messages }, :conflict)
        end
      end
    end
  end
end
