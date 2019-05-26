class Participant < ApplicationRecord
  has_many :participations, dependent: :destroy
  has_many :seasons, through: :participations
  has_many :accomplishments, through: :participations
  has_many :achievements, through: :accomplishments

  validates_presence_of :username
  validates_presence_of :friend_code

  validates_uniqueness_of :username, case_sensitive: false
  validates_uniqueness_of :friend_code, case_sensitive: false

  validates_length_of :username, maximum: 32
  validates_length_of :friend_code, maximum: 17
end
