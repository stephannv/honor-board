module HonorBoard
  class Base < Grape::API
    format :json

    # mount HonorBoard::V1::Base
  end
end
