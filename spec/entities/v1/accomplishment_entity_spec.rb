require 'rails_helper'

RSpec.describe V1::AccomplishmentEntity, type: :entity do
  let(:accomplishment) { build(:accomplishment, id: SecureRandom.uuid) }
  let(:serializable_hash) { described_class.new(accomplishment).serializable_hash }

  describe 'Exposures' do
    it 'exposes id' do
      expect(serializable_hash[:id]).to eq accomplishment.id
    end

    it 'exposes participation' do
      participation_hash = V1::ParticipationEntity.new(accomplishment.participation).serializable_hash
      expect(serializable_hash[:participation]).to eq participation_hash
    end

    it 'exposes achievement' do
      achievement_hash = V1::AchievementEntity.new(accomplishment.achievement).serializable_hash
      expect(serializable_hash[:achievement]).to eq achievement_hash
    end
  end
end
