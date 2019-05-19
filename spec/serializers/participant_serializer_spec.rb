require 'rails_helper'

RSpec.describe ParticipantSerializer, type: :serializer do
  describe 'Instance methods' do
    let(:participant) { build(:participant) }
    let(:serializer) { described_class.new(participant) }

    describe '#build_schema' do
      it 'returns built schema' do
        expect(serializer.build_schema).to eq(
          id: participant.id,
          username: participant.username
        )
      end
    end
  end
end
