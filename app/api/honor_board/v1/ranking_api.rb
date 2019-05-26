module HonorBoard
  module V1
    class RankingAPI < Grape::API
      # GET /ranking
      desc 'List ranking'

      get '/ranking' do
        ranking = Rank.all
        present :ranking, ranking, with: ::V1::RankEntity
      end
    end
  end
end
