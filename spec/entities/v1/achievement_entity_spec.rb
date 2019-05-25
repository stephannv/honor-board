require 'rails_helper'

RSpec.describe V1::AchievementEntity, type: :entity do
  let(:achievement) { build(:achievement, id: SecureRandom.uuid) }
  let(:serializable_hash) { described_class.new(achievement).serializable_hash }

  describe 'Exposures' do
    it 'exposes id' do
      expect(serializable_hash[:id]).to eq achievement.id
    end

    it 'exposes title' do
      expect(serializable_hash[:title]).to eq achievement.title
    end

    it 'exposes points' do
      expect(serializable_hash[:points]).to eq achievement.points
    end

    it 'exposes achievement_type' do
      expect(serializable_hash[:achievement_type]).to eq achievement.achievement_type_cd
    end

    it 'exposes order' do
      expect(serializable_hash[:order]).to eq achievement.order
    end
  end
end
