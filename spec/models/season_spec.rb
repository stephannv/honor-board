require 'rails_helper'

RSpec.describe Season, type: :model do
  describe 'Columns' do
    it { is_expected.to have_db_column(:title).of_type(:citext).with_options(null: false, unique: true) }
    it { is_expected.to have_db_column(:started_at).of_type(:date).with_options(null: false) }
  end

  describe 'Indexes' do
    it { is_expected.to have_db_index(:title) }
    it { is_expected.to have_db_index(:started_at) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :started_at }
    it do
      create(:season)
      is_expected.to validate_uniqueness_of(:title).case_insensitive
    end
    it { is_expected.to validate_length_of(:title).is_at_most(80) }
  end
end
