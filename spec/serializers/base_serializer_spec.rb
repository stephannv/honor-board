require 'rails_helper'

RSpec.describe BaseSerializer, type: :serializer do
  describe 'Inheritance' do
    it 'inherits from Surrealist::Serializer' do
      expect(described_class.superclass).to be Surrealist::Serializer
    end
  end

  describe 'Class methods' do
    describe '.represent' do
      let(:dummy_serializer) do
        Class.new(BaseSerializer) do
          json_schema { { title: String, created_at: Date } }
        end
      end

      let(:title) { Faker::Lorem.word }
      let(:created_at) { Time.zone.today }
      let(:object) do
        Struct.new(:title, :created_at).new(title, created_at)
      end

      it 'returns built schemas' do
        result = dummy_serializer.represent(object)
        expect(result).to eq(title: title, createdAt: created_at)
      end
    end
  end
end
