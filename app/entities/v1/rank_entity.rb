module V1
  class RankEntity < Grape::Entity
    expose :rank
    expose :participant_id
    expose :participant_username
    expose :total_points
    expose :participations_count
  end
end
