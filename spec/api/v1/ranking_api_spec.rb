require 'rails_helper'

RSpec.describe HonorBoard::V1::RankingAPI do
  describe 'GET /v1/ranking' do
    let(:rank) { build(:rank) }

    before do
      allow(Rank).to receive(:all).and_return([rank])
    end

    it 'returns ranking list' do
      get '/v1/ranking'

      expect(response).to have_http_status(:ok)
      expect(response.body).to eq({ ranking: [V1::RankEntity.new(rank)] }.to_json)
    end
  end
end
