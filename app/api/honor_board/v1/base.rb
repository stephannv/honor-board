module HonorBoard
  module V1
    class Base < Grape::API
      format :json
      version :v1, using: :path

      rescue_from Grape::Exceptions::ValidationErrors do |e|
        errors_hash = e.map { |attr, msg| { attr.first => msg } }
        error!({ errors: errors_hash }, 400)
      end

      rescue_from ActiveRecord::RecordNotFound do |e|
        error!({ error: e.message }, 404)
      end

      rescue_from :all do
        error!({ error: 'Internal server error' }, 500)
      end

      mount HonorBoard::V1::AchievementsAPI
      mount HonorBoard::V1::ParticipantsAPI
      mount HonorBoard::V1::ParticipationsAPI
      mount HonorBoard::V1::SeasonsAPI
    end
  end
end
