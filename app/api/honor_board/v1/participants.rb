module HonorBoard
  module V1
    class Participants < Grape::API
      # GET /participants
      desc 'List participants'

      get '/participants' do
        participants = Participant.all
        present :participants, participants, with: ParticipantSerializer
      end

      # GET /participants/:id
      desc 'Show participant details'

      params do
        requires :id, type: String
      end

      get '/participants/:id' do
        participant = Participant.find(params[:id])
        present :participant, participant, with: ParticipantSerializer
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
          present :participant, participant, with: ParticipantSerializer
        else
          error!({ errors: participant.errors.messages }, :unprocessable_entity)
        end
      end

      # PUT /participants/:id
      desc 'Update participant'

      params do
        requires :id, type: String
        requires :participant, type: Hash do
          requires :username, type: String
        end
      end

      put '/participants/:id' do
        participant = Participant.find(params[:id])

        if participant.update(declared(params)[:participant])
          present :participant, participant, with: ParticipantSerializer
        else
          error!({ errors: participant.errors.messages }, :unprocessable_entity)
        end
      end

      # DELETE /participants/:id
      desc 'Delete participant'

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
