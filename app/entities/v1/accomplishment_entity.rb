module V1
  class AccomplishmentEntity < Grape::Entity
    expose :id
    expose :participation, with: V1::ParticipationEntity
    expose :achievement, with: V1::AchievementEntity
  end
end
