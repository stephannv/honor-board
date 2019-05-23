require 'rails_helper'

RSpec.describe HonorBoard::V1::ParticipationsAPI do
  describe 'GET /v1/participations/:id' do
    let!(:participation) { create(:participation) }

    it 'returns participation details' do
      get "/v1/participations/#{participation.id}"

      expect(response).to have_http_status(:ok)
      expect(response.body).to eq({ participation: V1::ParticipationEntity.new(participation) }.to_json)
    end
  end

  describe 'POST /v1/participations' do
    context 'with valid attributes' do
      let(:valid_attributes) { { season_id: create(:season).id, participant_id: create(:participant).id } }

      it 'creates a new participation' do
        post '/v1/participations', params: { participation: valid_attributes }

        expect(response).to have_http_status(:created)
        expect(response.body).to eq({ participation: V1::ParticipationEntity.new(Participation.last) }.to_json)
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) { { season_id: nil, participant_id: nil } }
      let(:errors) { Participation.create(invalid_attributes).errors }

      it 'doesn`t create a new participation' do
        post '/v1/participations', params: { participation: invalid_attributes }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to eq({ errors: errors }.to_json)
      end
    end
  end

  describe 'DELETE /v1/participations/:id' do
    let!(:participation) { create(:participation) }

    context 'when destroys requested participation' do
      it 'returns no_content http status' do
        delete "/v1/participations/#{participation.id}"

        expect(response).to have_http_status(:no_content)
        expect(Participation.find_by(id: participation.id)).to be_nil
      end
    end

    context 'when doesn`t destroys requested participation' do
      before do
        allow_any_instance_of(Participation).to receive(:destroy).and_return(false)
      end

      it 'returns conflict http status' do
        delete "/v1/participations/#{participation.id}"

        expect(response).to have_http_status(:conflict)
      end
    end
  end
end
