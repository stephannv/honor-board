module V1
  class SeasonEntity < Grape::Entity
    expose :id
    expose :title
    expose :started_at
    expose :participations, if: { type: :detailed } do |season, _options|
      V1::ParticipationEntity.represent season.participations, except: [:season]
    end
  end
end
