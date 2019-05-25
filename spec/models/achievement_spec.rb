require 'rails_helper'

RSpec.describe Achievement, type: :model do
  describe 'Columns' do
    it { is_expected.to have_db_column(:title).of_type(:citext).with_options(null: false, unique: true) }
    it { is_expected.to have_db_column(:points).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:achievement_type_cd).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:order).of_type(:string).with_options(null: false) }
  end

  describe 'Indexes' do
    it { is_expected.to have_db_index(:achievement_type_cd) }
    it { is_expected.to have_db_index(:order) }
  end

  describe 'Enums' do
    it 'has .achievement_types' do
      expect(Achievement.achievement_types.hash).to eq(
        'title' => 'title',
        'other' => 'other'
      )
    end
  end

  describe 'Relations' do
    it { is_expected.to have_many(:accomplishments).dependent(:destroy) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:points) }
    it { is_expected.to validate_presence_of(:achievement_type) }
    it { is_expected.to validate_presence_of(:order) }

    it do
      create(:achievement)
      is_expected.to validate_uniqueness_of(:title).case_insensitive
    end

    it { is_expected.to validate_length_of(:title).is_at_most(80) }
    it { is_expected.to validate_length_of(:order).is_at_most(12) }

    it { is_expected.to validate_numericality_of(:points).is_greater_than_or_equal_to(0) }
  end
end
