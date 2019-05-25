module HonorBoard
  module V1
    class AchievementsAPI < Grape::API
      # GET /achievements
      desc 'List achievements'

      get '/achievements' do
        achievements = Achievement.all
        present :achievements, achievements, with: ::V1::AchievementEntity
      end

      # GET /achievements/:id
      desc 'Show requested achievement details'

      params do
        requires :id, type: String
      end

      get '/achievements/:id' do
        achievement = Achievement.find(params[:id])
        present :achievement, achievement, with: ::V1::AchievementEntity, type: :detailed
      end

      # POST /achievements
      desc 'Create achievement'

      params do
        requires :achievement, type: Hash do
          requires :title, type: String
          requires :points, type: Integer
          requires :achievement_type, type: String, values: Achievement.achievement_types.values
          requires :order, type: String
        end
      end

      post '/achievements' do
        achievement = Achievement.new(declared(params)[:achievement])

        if achievement.save
          present :achievement, achievement, with: ::V1::AchievementEntity
        else
          error!({ errors: achievement.errors.messages }, :unprocessable_entity)
        end
      end

      # PUT /achievements/:id
      desc 'Update requested achievement'

      params do
        requires :id, type: String
        requires :achievement, type: Hash do
          requires :title, type: String
          requires :points, type: Integer
          requires :achievement_type, type: String, values: Achievement.achievement_types.values
          requires :order, type: String
        end
      end

      put '/achievements/:id' do
        achievement = Achievement.find(params[:id])

        if achievement.update(declared(params)[:achievement])
          present :achievement, achievement, with: ::V1::AchievementEntity
        else
          error!({ errors: achievement.errors.messages }, :unprocessable_entity)
        end
      end

      # DELETE /achievements/:id
      desc 'Destroy requested achievement'

      params do
        requires :id, type: String
      end

      delete '/achievements/:id' do
        achievement = Achievement.find(params[:id])

        if achievement.destroy
          status :no_content
        else
          error!({ errors: achievement.errors.messages }, :conflict)
        end
      end
    end
  end
end
