require 'rails_helper'

RSpec.describe HonorBoard::V1::AchievementsAPI do
  let(:allowed_attributes) { %i[title points achievement_type order] }

  describe 'GET /v1/achievements' do
    let!(:achievement) { create(:achievement) }

    it 'returns achievements list' do
      get '/v1/achievements'

      expect(response).to have_http_status(:ok)
      expect(response.body).to eq({ achievements: [V1::AchievementEntity.new(achievement)] }.to_json)
    end
  end

  describe 'GET /v1/achievements/:id' do
    let!(:achievement) { create(:achievement) }

    it 'returns achievement details' do
      get "/v1/achievements/#{achievement.id}"

      expect(response).to have_http_status(:ok)
      expect(response.body).to eq({ achievement: V1::AchievementEntity.new(achievement) }.to_json)
    end
  end

  describe 'POST /v1/achievements' do
    context 'with valid attributes' do
      let(:valid_attributes) { attributes_for(:achievement).slice(*allowed_attributes) }

      it 'creates a new achievement' do
        post '/v1/achievements', params: { achievement: valid_attributes }

        expect(response).to have_http_status(:created)
        expect(response.body).to eq({ achievement: V1::AchievementEntity.new(Achievement.last) }.to_json)
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) { attributes_for(:achievement, title: nil).slice(*allowed_attributes) }
      let(:errors) { Achievement.create(invalid_attributes).errors }

      it 'doesn`t create a new achievement' do
        post '/v1/achievements', params: { achievement: invalid_attributes }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to eq({ errors: errors }.to_json)
      end
    end
  end

  describe 'PUT /v1/achievements/:id' do
    let!(:achievement) { create(:achievement) }

    context 'with valid attributes' do
      let(:valid_attributes) { attributes_for(:achievement).slice(*allowed_attributes) }

      it 'updates requested achievement' do
        put "/v1/achievements/#{achievement.id}", params: { achievement: valid_attributes }

        achievement.reload
        expect(achievement.title).to eq valid_attributes[:title]
        expect(achievement.points).to eq valid_attributes[:points]
        expect(achievement.achievement_type.to_s).to eq valid_attributes[:achievement_type]
        expect(achievement.order).to eq valid_attributes[:order]
      end

      it 'returns updated achievement' do
        put "/v1/achievements/#{achievement.id}", params: { achievement: valid_attributes }

        expect(response).to have_http_status(:ok)
        expect(response.body).to eq({ achievement: V1::AchievementEntity.new(achievement.reload) }.to_json)
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) { attributes_for(:achievement, title: nil).slice(*allowed_attributes) }
      let(:errors) { Achievement.create(invalid_attributes).errors }

      it 'doesn`t update requested achievement' do
        put "/v1/achievements/#{achievement.id}", params: { achievement: invalid_attributes }

        # byebug
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to eq({ errors: errors }.to_json)
      end
    end
  end

  describe 'DELETE /v1/achievements/:id' do
    let!(:achievement) { create(:achievement) }

    context 'when destroys requested achievement' do
      it 'returns no_content http status' do
        delete "/v1/achievements/#{achievement.id}"

        expect(response).to have_http_status(:no_content)
        expect(Achievement.find_by(id: achievement.id)).to be_nil
      end
    end

    context 'when doesn`t destroys requested achievement' do
      before do
        allow_any_instance_of(Achievement).to receive(:destroy).and_return(false)
      end

      it 'returns conflict http status' do
        delete "/v1/achievements/#{achievement.id}"

        expect(response).to have_http_status(:conflict)
      end
    end
  end
end
