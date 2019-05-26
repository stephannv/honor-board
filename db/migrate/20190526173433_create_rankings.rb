class CreateRankings < ActiveRecord::Migration[6.0]
  def change
    create_view :ranking
  end
end
