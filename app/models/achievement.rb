class Achievement < ApplicationRecord
  as_enum :achievement_type, %i[title other], map: :string

  has_many :accomplishments, dependent: :destroy

  validates_presence_of :title
  validates_presence_of :order
  validates_presence_of :points
  validates_presence_of :achievement_type

  validates_uniqueness_of :title

  validates_length_of :title, maximum: 80
  validates_length_of :order, maximum: 12

  validates_numericality_of :points, greater_than_or_equal_to: 0
end
