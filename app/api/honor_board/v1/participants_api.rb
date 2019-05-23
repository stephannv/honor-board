module HonorBoard
  module V1
    class ParticipantsAPI < Grape::API
      # GET /participants
      desc 'List participants'

      get '/participants' do
        participants = Participant.all
        present :participants, participants, with: ::V1::ParticipantEntity
      end

      # GET /participants/:id
      desc 'Show requested participant details'

      params do
        requires :id, type: String
      end

      get '/participants/:id' do
        participant = Participant.find(params[:id])
        present :participant, participant, with: ::V1::ParticipantEntity, type: :detailed
      end

      # POST /participants
      desc 'Create participant'

      params do
        requires :participant, type: Hash do
          requires :username, type: String
        end
      end

      post '/participants' do
        participant = Participant.new(declared(params)[:participant])

        if participant.save
          present :participant, participant, with: ::V1::ParticipantEntity
        else
          error!({ errors: participant.errors.messages }, :unprocessable_entity)
        end
      end

      # PUT /participants/:id
      desc 'Update requested participant'

      params do
        requires :id, type: String
        requires :participant, type: Hash do
          requires :username, type: String
        end
      end

      put '/participants/:id' do
        participant = Participant.find(params[:id])

        if participant.update(declared(params)[:participant])
          present :participant, participant, with: ::V1::ParticipantEntity
        else
          error!({ errors: participant.errors.messages }, :unprocessable_entity)
        end
      end

      # DELETE /participants/:id
      desc 'Destroy requested participant'

      params do
        requires :id, type: String
      end

      delete '/participants/:id' do
        participant = Participant.find(params[:id])

        if participant.destroy
          status :no_content
        else
          error!({ errors: participant.errors.messages }, :conflict)
        end
      end
    end
  end
end
