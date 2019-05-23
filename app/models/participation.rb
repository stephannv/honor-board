class Participation < ApplicationRecord
  belongs_to :participant
  belongs_to :season

  validates_presence_of :participant_id
  validates_presence_of :season_id

  validates_uniqueness_of :participant_id,
    scope: :season_id,
    case_sensitive: false,
    message: lambda { |obj, _data|
      message_id = 'activerecord.errors.models.participation.attributes.participant_id.duplicated'
      I18n.t(message_id, season: obj.season_id)
    }
end
