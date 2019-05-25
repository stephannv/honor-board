class CreateAchievements < ActiveRecord::Migration[6.0]
  def change
    create_table :achievements, id: :uuid do |t|
      t.citext :title, null: false, unique: true
      t.integer :points, null: false
      t.string :achievement_type_cd, null: false, index: true
      t.string :order, null: false, index: true

      t.timestamps
    end
  end
end
