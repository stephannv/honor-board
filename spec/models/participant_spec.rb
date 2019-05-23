require 'rails_helper'

RSpec.describe Participant, type: :model do
  describe 'Columns' do
    it { is_expected.to have_db_column(:username).of_type(:citext).with_options(null: false, unique: true) }
  end

  describe 'Indexes' do
    it { is_expected.to have_db_index(:username) }
  end

  describe 'Relations' do
    it { is_expected.to have_many(:participations) }
    it { is_expected.to have_many(:seasons).through(:participations) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :username }
    it do
      create(:participant)
      is_expected.to validate_uniqueness_of(:username).case_insensitive
    end
    it { is_expected.to validate_length_of(:username).is_at_most(32) }
  end
end
