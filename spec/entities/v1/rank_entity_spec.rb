require 'rails_helper'

RSpec.describe V1::RankEntity, type: :entity do
  let(:rank) { build(:rank) }
  let(:serializable_hash) { described_class.new(rank).serializable_hash }

  describe 'Exposures' do
    it 'exposes rank' do
      expect(serializable_hash[:rank]).to eq rank.rank
    end

    it 'exposes participant_id' do
      expect(serializable_hash[:participant_id]).to eq rank.participant_id
    end

    it 'exposes participant_username' do
      expect(serializable_hash[:participant_username]).to eq rank.participant_username
    end

    it 'exposes total_points' do
      expect(serializable_hash[:total_points]).to eq rank.total_points
    end

    it 'exposes participations_count' do
      expect(serializable_hash[:participations_count]).to eq rank.participations_count
    end
  end
end
