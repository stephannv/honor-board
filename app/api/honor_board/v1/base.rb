module HonorBoard
  module V1
    class Base < Grape::API
      version :v1, using: :path

      # example:
      # mount HonorBoard::V1::Resource
    end
  end
end
