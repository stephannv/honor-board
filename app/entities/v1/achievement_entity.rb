module V1
  class AchievementEntity < Grape::Entity
    expose :id
    expose :title
    expose :points
    expose :achievement_type_cd, as: :achievement_type
    expose :order
  end
end
