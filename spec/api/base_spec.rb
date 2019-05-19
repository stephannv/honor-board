require 'rails_helper'

RSpec.describe HonorBoard::Base do
  describe 'Mounted apps' do
    it 'mounts HonorBoard::V1::Base app' do
      is_routes_included = HonorBoard::V1::Base.routes.all? { |route| described_class.routes.include?(route) }
      expect(is_routes_included).to be_truthy
    end
  end
end
