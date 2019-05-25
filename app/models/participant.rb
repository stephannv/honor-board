class Participant < ApplicationRecord
  has_many :participations, dependent: :destroy
  has_many :seasons, through: :participations

  validates_presence_of :username
  validates_uniqueness_of :username, case_sensitive: false
  validates_length_of :username, maximum: 32
end
