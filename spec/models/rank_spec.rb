require 'rails_helper'

RSpec.describe Rank, type: :model do
  describe 'Columns' do
    it { is_expected.to have_db_column(:rank).of_type(:integer) }
    it { is_expected.to have_db_column(:participant_id).of_type(:uuid) }
    it { is_expected.to have_db_column(:participant_username).of_type(:citext) }
    it { is_expected.to have_db_column(:total_points).of_type(:integer) }
    it { is_expected.to have_db_column(:participations_count).of_type(:integer) }
  end
end
