class Season < ApplicationRecord
  has_many :participations, dependent: :destroy
  has_many :participants, through: :participations

  validates_presence_of :title
  validates_presence_of :started_at

  validates_uniqueness_of :title, case_sensitive: false

  validates_length_of :title, maximum: 80
end
