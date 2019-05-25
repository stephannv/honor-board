class Accomplishment < ApplicationRecord
  belongs_to :participation
  belongs_to :achievement

  validates_presence_of :participation_id
  validates_presence_of :achievement_id

  validates_uniqueness_of :participation_id,
    scope: :achievement_id,
    case_sensitive: false,
    message: lambda { |obj, _data|
      message_id = 'activerecord.errors.models.accomplishment.attributes.participation_id.duplicated'
      I18n.t(message_id, achievement: obj.achievement_id)
    }
end
