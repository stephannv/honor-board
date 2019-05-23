require 'rails_helper'

RSpec.describe HonorBoard::V1::SeasonsAPI do
  describe 'GET /v1/seasons' do
    let!(:season) { create(:season) }

    it 'returns seasons list' do
      get '/v1/seasons'

      expect(response).to have_http_status(:ok)
      expect(response.body).to eq({ seasons: [V1::SeasonEntity.new(season)] }.to_json)
    end
  end

  describe 'GET /v1/seasons/:id' do
    let!(:season) { create(:season) }

    it 'returns season details' do
      get "/v1/seasons/#{season.id}"

      expect(response).to have_http_status(:ok)
      expect(response.body).to eq({ season: V1::SeasonEntity.new(season, type: :detailed) }.to_json)
    end
  end

  describe 'POST /v1/seasons' do
    context 'with valid attributes' do
      let(:valid_attributes) { attributes_for(:season).slice(:title, :started_at) }

      it 'creates a new season' do
        post '/v1/seasons', params: { season: valid_attributes }

        expect(response).to have_http_status(:created)
        expect(response.body).to eq({ season: V1::SeasonEntity.new(Season.last) }.to_json)
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) { { title: nil, started_at: nil } }
      let(:errors) { Season.create(invalid_attributes).errors }

      it 'doesn`t create a new season' do
        post '/v1/seasons', params: { season: invalid_attributes }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to eq({ errors: errors }.to_json)
      end
    end
  end

  describe 'PUT /v1/seasons/:id' do
    let!(:season) { create(:season) }

    context 'with valid attributes' do
      let(:valid_attributes) { attributes_for(:season).slice(:title, :started_at) }

      it 'updates requested season' do
        put "/v1/seasons/#{season.id}", params: { season: valid_attributes }

        expect(season.reload.title).to eq valid_attributes[:title]
        expect(season.reload.started_at).to eq valid_attributes[:started_at]
      end

      it 'returns updated season' do
        put "/v1/seasons/#{season.id}", params: { season: valid_attributes }

        expect(response).to have_http_status(:ok)
        expect(response.body).to eq({ season: V1::SeasonEntity.new(season.reload) }.to_json)
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) { { title: nil, started_at: nil } }
      let(:errors) { Season.create(invalid_attributes).errors }

      it 'doesn`t update requested season' do
        put "/v1/seasons/#{season.id}", params: { season: invalid_attributes }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to eq({ errors: errors }.to_json)
      end
    end
  end

  describe 'DELETE /v1/seasons/:id' do
    let!(:season) { create(:season) }

    context 'when destroys requested season' do
      it 'returns no_content http status' do
        delete "/v1/seasons/#{season.id}"

        expect(response).to have_http_status(:no_content)
        expect(Season.find_by(id: season.id)).to be_nil
      end
    end

    context 'when doesn`t destroys requested season' do
      before do
        allow_any_instance_of(Season).to receive(:destroy).and_return(false)
      end

      it 'returns conflict http status' do
        delete "/v1/seasons/#{season.id}"

        expect(response).to have_http_status(:conflict)
      end
    end
  end
end
