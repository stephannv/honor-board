require 'rails_helper'

RSpec.describe Participation, type: :model do
  describe 'Columns' do
    it { is_expected.to have_db_column(:participant_id).of_type(:uuid).with_options(null: false) }
    it { is_expected.to have_db_column(:season_id).of_type(:uuid).with_options(null: false) }
  end

  describe 'Indexes' do
    it { is_expected.to have_db_index(:participant_id) }
    it { is_expected.to have_db_index(:season_id) }
    it { is_expected.to have_db_index(%i[participant_id season_id]).unique(true) }
  end

  describe 'Relations' do
    it { is_expected.to belong_to(:participant) }
    it { is_expected.to belong_to(:season) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :participant_id }
    it { is_expected.to validate_presence_of :season_id }
    it do
      participation = create(:participation)
      message_id = 'activerecord.errors.models.participation.attributes.participant_id.duplicated'
      message = I18n.t(message_id, season: participation.season_id)

      is_expected.to validate_uniqueness_of(:participant_id)
        .scoped_to(:season_id)
        .with_message(message)
        .case_insensitive
    end
  end
end
