require 'rails_helper'

RSpec.describe V1::ParticipantEntity, type: :entity do
  let(:participant) { build(:participant, id: SecureRandom.uuid) }
  let(:serializable_hash) { described_class.new(participant).serializable_hash }
  let(:detailed_serializable_hash) { described_class.new(participant, type: :detailed).serializable_hash }

  describe 'Exposures' do
    it 'exposes id' do
      expect(serializable_hash[:id]).to eq participant.id
      expect(detailed_serializable_hash[:id]).to eq participant.id
    end

    it 'exposes username' do
      expect(serializable_hash[:username]).to eq participant.username
      expect(detailed_serializable_hash[:username]).to eq participant.username
    end

    context 'when type is detailed' do
      it 'exposes participation excluding participant' do
        participant.participations = [build(:participation)]
        participations_hash = participant.participations.map do |p|
          V1::ParticipationEntity.new(p, except: [:participant]).serializable_hash
        end

        expect(serializable_hash[:participations]).to_not eq participations_hash
        expect(detailed_serializable_hash[:participations]).to eq participations_hash
      end
    end
  end
end
