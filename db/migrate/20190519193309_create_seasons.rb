class CreateSeasons < ActiveRecord::Migration[6.0]
  def change
    create_table :seasons, id: :uuid do |t|
      t.citext :title, null: false, unique: true, index: true
      t.date :started_at, null: false, index: true

      t.timestamps
    end
  end
end
