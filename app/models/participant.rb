class Participant < ApplicationRecord
  include Surrealist

  surrealize_with ParticipantSerializer

  validates_presence_of :username
  validates_uniqueness_of :username, case_sensitive: false
  validates_length_of :username, maximum: 32
end
