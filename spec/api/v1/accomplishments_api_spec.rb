require 'rails_helper'

RSpec.describe HonorBoard::V1::AccomplishmentsAPI do
  describe 'GET /v1/accomplishments/:id' do
    let!(:accomplishment) { create(:accomplishment) }

    it 'returns accomplishment details' do
      get "/v1/accomplishments/#{accomplishment.id}"

      expect(response).to have_http_status(:ok)
      expect(response.body).to eq({ accomplishment: V1::AccomplishmentEntity.new(accomplishment) }.to_json)
    end
  end

  describe 'POST /v1/accomplishments' do
    context 'with valid attributes' do
      let(:valid_attributes) do
        { participation_id: create(:participation).id, achievement_id: create(:achievement).id }
      end

      it 'creates a new accomplishment' do
        post '/v1/accomplishments', params: { accomplishment: valid_attributes }

        expect(response).to have_http_status(:created)
        expect(response.body).to eq({ accomplishment: V1::AccomplishmentEntity.new(Accomplishment.last) }.to_json)
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) { { participation_id: nil, achievement_id: nil } }
      let(:errors) { Accomplishment.create(invalid_attributes).errors }

      it 'doesn`t create a new accomplishment' do
        post '/v1/accomplishments', params: { accomplishment: invalid_attributes }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to eq({ errors: errors }.to_json)
      end
    end
  end

  describe 'DELETE /v1/accomplishments/:id' do
    let!(:accomplishment) { create(:accomplishment) }

    context 'when destroys requested accomplishment' do
      it 'returns no_content http status' do
        delete "/v1/accomplishments/#{accomplishment.id}"

        expect(response).to have_http_status(:no_content)
        expect(Accomplishment.find_by(id: accomplishment.id)).to be_nil
      end
    end

    context 'when doesn`t destroys requested accomplishment' do
      before do
        allow_any_instance_of(Accomplishment).to receive(:destroy).and_return(false)
      end

      it 'returns conflict http status' do
        delete "/v1/accomplishments/#{accomplishment.id}"

        expect(response).to have_http_status(:conflict)
      end
    end
  end
end
