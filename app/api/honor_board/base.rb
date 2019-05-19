module HonorBoard
  class Base < Grape::API
    mount HonorBoard::V1::Base
  end
end
