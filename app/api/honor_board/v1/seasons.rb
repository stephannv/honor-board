module HonorBoard
  module V1
    class Seasons < Grape::API
      # GET /seasons
      desc 'List seasons'

      get '/seasons' do
        seasons = Season.all
        present :seasons, seasons, with: SeasonSerializer
      end

      # GET /seasons/:id
      desc 'Show season details'

      params do
        requires :id, type: String
      end

      get '/seasons/:id' do
        season = Season.find(params[:id])
        present :season, season, with: SeasonSerializer
      end

      # POST /seasons
      desc 'Create season'

      params do
        requires :season, type: Hash do
          requires :title, type: String
          requires :started_at, type: Date
        end
      end

      post '/seasons' do
        season = Season.new(declared(params)[:season])

        if season.save
          present :season, season, with: SeasonSerializer
        else
          error!({ errors: season.errors.messages }, :unprocessable_entity)
        end
      end

      # PUT /seasons/:id
      desc 'Update season'

      params do
        requires :id, type: String
        requires :season, type: Hash do
          requires :title, type: String
          requires :started_at, type: Date
        end
      end

      put '/seasons/:id' do
        season = Season.find(params[:id])

        if season.update(declared(params)[:season])
          present :season, season, with: SeasonSerializer
        else
          error!({ errors: season.errors.messages }, :unprocessable_entity)
        end
      end

      # DELETE /seasons/:id
      desc 'Delete season'

      params do
        requires :id, type: String
      end

      delete '/seasons/:id' do
        season = Season.find(params[:id])

        if season.destroy
          status :no_content
        else
          error!({ errors: season.errors.messages }, :conflict)
        end
      end
    end
  end
end
