module V1
  class ParticipantEntity < Grape::Entity
    expose :id
    expose :username
    expose :participations, if: { type: :detailed } do |participant, _options|
      V1::ParticipationEntity.represent participant.participations, except: [:participant]
    end
  end
end
