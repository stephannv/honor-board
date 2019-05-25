require 'rails_helper'

RSpec.describe Accomplishment, type: :model do
  describe 'Columns' do
    it { is_expected.to have_db_column(:participation_id).of_type(:uuid).with_options(null: false) }
    it { is_expected.to have_db_column(:achievement_id).of_type(:uuid).with_options(null: false) }
  end

  describe 'Indexes' do
    it { is_expected.to have_db_index(:participation_id) }
    it { is_expected.to have_db_index(:achievement_id) }
    it { is_expected.to have_db_index(%i[participation_id achievement_id]).unique(true) }
  end

  describe 'Relations' do
    it { is_expected.to belong_to(:participation) }
    it { is_expected.to belong_to(:achievement) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :participation_id }
    it { is_expected.to validate_presence_of :achievement_id }
    it do
      accomplishment = create(:accomplishment)
      message_id = 'activerecord.errors.models.accomplishment.attributes.participation_id.duplicated'
      message = I18n.t(message_id, achievement: accomplishment.achievement_id)

      is_expected.to validate_uniqueness_of(:participation_id)
        .scoped_to(:achievement_id)
        .with_message(message)
        .case_insensitive
    end
  end
end
