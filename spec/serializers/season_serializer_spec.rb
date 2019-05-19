require 'rails_helper'

RSpec.describe SeasonSerializer, type: :serializer do
  describe 'Instance methods' do
    let(:season) { build(:season) }
    let(:serializer) { described_class.new(season) }

    describe '#build_schema' do
      it 'returns built schema' do
        expect(serializer.build_schema).to eq(
          id: season.id,
          title: season.title,
          startedAt: season.started_at
        )
      end
    end
  end
end
