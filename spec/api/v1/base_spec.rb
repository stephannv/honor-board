require 'rails_helper'

RSpec.describe HonorBoard::V1::Base do
  describe 'Configurations' do
    it 'has json format' do
      expect(described_class.format).to eq :json
    end

    it 'has v1 as version' do
      expect(described_class.version).to eq :v1
    end
  end

  describe 'Mounted apps' do
    let(:base_routes) { described_class.routes.map(&:path) }

    it 'mounts HonorBoard::V1::AccomplishmentsAPI app' do
      HonorBoard::V1::AccomplishmentsAPI.routes.each do |route|
        expect(base_routes).to include(route.path)
      end
    end

    it 'mounts HonorBoard::V1::AchievementsAPI app' do
      HonorBoard::V1::AchievementsAPI.routes.each do |route|
        expect(base_routes).to include(route.path)
      end
    end

    it 'mounts HonorBoard::V1::ParticipantsAPI app' do
      HonorBoard::V1::ParticipantsAPI.routes.each do |route|
        expect(base_routes).to include(route.path)
      end
    end

    it 'mounts HonorBoard::V1::ParticipationsAPI app' do
      HonorBoard::V1::ParticipationsAPI.routes.each do |route|
        expect(base_routes).to include(route.path)
      end
    end

    it 'mounts HonorBoard::V1::RankingAPI app' do
      HonorBoard::V1::RankingAPI.routes.each do |route|
        expect(base_routes).to include(route.path)
      end
    end

    it 'mounts HonorBoard::V1::SeasonsAPI app' do
      HonorBoard::V1::SeasonsAPI.routes.each do |route|
        expect(base_routes).to include(route.path)
      end
    end
  end

  describe 'Rescued errors' do
    subject { Class.new(HonorBoard::V1::Base) }

    def app
      subject
    end

    context 'when Grape::Exceptions::ValidationErrors is raised' do
      before do
        subject.params do
          requires :required_param, type: String
        end
        subject.get '/example' do
          raise Grape::Exceptions::ValidationErrors
        end
      end

      it 'formats params errors as json' do
        get '/v1/example'

        expect(response.body).to eq({ errors: [{ required_param: 'is missing' }] }.to_json)
      end

      it 'responds with 400 http code' do
        get '/v1/example'

        expect(response).to have_http_status(:bad_request)
      end
    end

    context 'when ActiveRecord::RecordNotFound is raised' do
      before do
        subject.get '/example' do
          raise ActiveRecord::RecordNotFound, 'not found'
        end
      end

      it 'format error as json' do
        get '/v1/example'

        expect(response.body).to eq({ error: 'not found' }.to_json)
      end

      it 'responds with 404 http code' do
        get '/v1/example'

        expect(response).to have_http_status(:not_found)
      end
    end

    context 'when an unexpected exception is raised' do
      before do
        subject.get '/example' do
          raise 'Some error'
        end
      end

      it 'format error as json' do
        get '/v1/example'

        expect(response.body).to eq({ error: 'Internal server error' }.to_json)
      end

      it 'responds with 500 http code' do
        get '/v1/example'

        expect(response).to have_http_status(:server_error)
      end
    end
  end
end
