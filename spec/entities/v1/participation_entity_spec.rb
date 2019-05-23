require 'rails_helper'

RSpec.describe V1::ParticipationEntity, type: :entity do
  let(:participation) { build(:participation, id: SecureRandom.uuid) }
  let(:serializable_hash) { described_class.new(participation).serializable_hash }

  describe 'Exposures' do
    it 'exposes id' do
      expect(serializable_hash[:id]).to eq participation.id
    end

    it 'exposes participant' do
      participant_hash = V1::ParticipantEntity.new(participation.participant).serializable_hash
      expect(serializable_hash[:participant]).to eq participant_hash
    end

    it 'exposes season' do
      season_hash = V1::SeasonEntity.new(participation.season).serializable_hash
      expect(serializable_hash[:season]).to eq season_hash
    end
  end
end
