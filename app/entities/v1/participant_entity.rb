module V1
  class ParticipantEntity < Grape::Entity
    expose :id
    expose :username
    expose :friend_code

    expose :seasons_count, if: { type: :detailed } do |participant, _options|
      participant.seasons.size
    end

    expose :achievements_count, if: { type: :detailed } do |participant, _options|
      participant.achievements.size
    end

    expose :titles_count, if: { type: :detailed } do |participant, _options|
      participant.achievements.titles.size
    end
  end
end
