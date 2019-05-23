require 'rails_helper'

RSpec.describe V1::SeasonEntity, type: :entity do
  let(:season) { build(:season, id: SecureRandom.uuid) }
  let(:serializable_hash) { described_class.new(season).serializable_hash }
  let(:detailed_serializable_hash) { described_class.new(season, type: :detailed).serializable_hash }

  describe 'Exposures' do
    it 'exposes id' do
      expect(serializable_hash[:id]).to eq season.id
      expect(detailed_serializable_hash[:id]).to eq season.id
    end

    it 'exposes title' do
      expect(serializable_hash[:title]).to eq season.title
      expect(detailed_serializable_hash[:title]).to eq season.title
    end

    it 'exposes started_at' do
      expect(serializable_hash[:started_at]).to eq season.started_at
      expect(detailed_serializable_hash[:started_at]).to eq season.started_at
    end

    context 'when type is detailed' do
      it 'exposes participation excluding season' do
        season.participations = [build(:participation)]
        participations_hash = season.participations.map do |p|
          V1::ParticipationEntity.new(p, except: [:season]).serializable_hash
        end

        expect(serializable_hash[:participations]).to_not eq participations_hash
        expect(detailed_serializable_hash[:participations]).to eq participations_hash
      end
    end
  end
end
