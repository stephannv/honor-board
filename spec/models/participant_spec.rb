require 'rails_helper'

RSpec.describe Participant, type: :model do
  describe 'Columns' do
    it { is_expected.to have_db_column(:username).of_type(:citext).with_options(null: false, unique: true) }
    it { is_expected.to have_db_column(:friend_code).of_type(:citext).with_options(null: false, unique: true) }
  end

  describe 'Indexes' do
    it { is_expected.to have_db_index(:username) }
  end

  describe 'Relations' do
    it { is_expected.to have_many(:participations).dependent(:destroy) }
    it { is_expected.to have_many(:seasons).through(:participations) }
    it { is_expected.to have_many(:accomplishments).through(:participations) }
    it { is_expected.to have_many(:achievements).through(:accomplishments) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :username }
    it { is_expected.to validate_presence_of :friend_code }

    it do
      create(:participant)
      is_expected.to validate_uniqueness_of(:username).case_insensitive
    end

    it do
      create(:participant)
      is_expected.to validate_uniqueness_of(:friend_code).case_insensitive
    end

    it { is_expected.to validate_length_of(:username).is_at_most(32) }
    it { is_expected.to validate_length_of(:friend_code).is_at_most(17) }
  end
end
