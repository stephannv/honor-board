require 'rails_helper'

RSpec.describe HonorBoard::V1::Participants do
  describe 'GET /v1/participants' do
    let!(:participant) { create(:participant) }

    it 'returns participants list' do
      get '/v1/participants'

      expect(response).to have_http_status(:ok)
      expect(response.body).to eq({ participants: [participant.build_schema] }.to_json)
    end
  end

  describe 'GET /v1/participants/:id' do
    let!(:participant) { create(:participant) }

    it 'returns participant details' do
      get "/v1/participants/#{participant.id}"

      expect(response).to have_http_status(:ok)
      expect(response.body).to eq({ participant: participant.build_schema }.to_json)
    end
  end

  describe 'POST /v1/participants' do
    context 'with valid attributes' do
      let(:valid_attributes) { attributes_for(:participant).slice(:username) }

      it 'creates a new participant' do
        post '/v1/participants', params: { participant: valid_attributes }

        expect(response).to have_http_status(:created)
        expect(response.body).to eq({ participant: Participant.last.build_schema }.to_json)
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) { { username: nil } }
      let(:errors) { Participant.create(invalid_attributes).errors }

      it 'doesn`t create a new participant' do
        post '/v1/participants', params: { participant: invalid_attributes }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to eq({ errors: errors }.to_json)
      end
    end
  end

  describe 'PUT /v1/participants/:id' do
    let!(:participant) { create(:participant) }

    context 'with valid attributes' do
      let(:valid_attributes) { attributes_for(:participant).slice(:username) }

      it 'updates requested participant' do
        put "/v1/participants/#{participant.id}", params: { participant: valid_attributes }

        expect(participant.reload.username).to eq valid_attributes[:username]
      end

      it 'returns updated participant' do
        put "/v1/participants/#{participant.id}", params: { participant: valid_attributes }

        expect(response).to have_http_status(:ok)
        expect(response.body).to eq({ participant: participant.reload.build_schema }.to_json)
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) { { username: nil } }
      let(:errors) { Participant.create(invalid_attributes).errors }

      it 'doesn`t update requested participant' do
        put "/v1/participants/#{participant.id}", params: { participant: invalid_attributes }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to eq({ errors: errors }.to_json)
      end
    end
  end

  describe 'DELETE /v1/participants/:id' do
    let!(:participant) { create(:participant) }

    context 'when destroys requested participant' do
      it 'returns no_content http status' do
        delete "/v1/participants/#{participant.id}"

        expect(response).to have_http_status(:no_content)
        expect(Participant.find_by(id: participant.id)).to be_nil
      end
    end

    context 'when doesn`t destroys requested participant' do
      before do
        allow_any_instance_of(Participant).to receive(:destroy).and_return(false)
      end

      it 'returns conflict http status' do
        delete "/v1/participants/#{participant.id}"

        expect(response).to have_http_status(:conflict)
      end
    end
  end
end
