module V1
  class ParticipationEntity < Grape::Entity
    expose :id
    expose :participant, with: V1::ParticipantEntity
    expose :season, with: V1::SeasonEntity
  end
end
