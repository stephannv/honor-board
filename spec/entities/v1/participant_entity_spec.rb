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

    it 'exposes friend_code' do
      expect(serializable_hash[:friend_code]).to eq participant.friend_code
      expect(detailed_serializable_hash[:friend_code]).to eq participant.friend_code
    end

    context 'when type is detailed' do
      it 'exposes seasons count' do
        participant.seasons = build_list(:season, Faker::Number.between(1, 5))

        expect(serializable_hash[:seasons_count]).to be_nil
        expect(detailed_serializable_hash[:seasons_count]).to eq participant.seasons.size
      end

      it 'exposes achievements count' do
        allow(participant).to receive_message_chain('achievements.size').and_return(Faker::Number.between(1, 5))
        allow(participant).to receive_message_chain('achievements.titles.size').and_return(Faker::Number.between(1, 5))

        expect(serializable_hash[:achievements_count]).to be_nil
        expect(detailed_serializable_hash[:achievements_count]).to eq participant.achievements.size
      end

      it 'exposes titles count' do
        allow(participant).to receive_message_chain('achievements.size').and_return(Faker::Number.between(1, 5))
        allow(participant).to receive_message_chain('achievements.titles.size').and_return(Faker::Number.between(1, 5))

        expect(serializable_hash[:titles_count]).to be_nil
        expect(detailed_serializable_hash[:titles_count]).to eq participant.achievements.titles.size
      end
    end
  end
end
