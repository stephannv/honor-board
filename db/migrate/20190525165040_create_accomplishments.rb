class CreateAccomplishments < ActiveRecord::Migration[6.0]
  def change
    create_table :accomplishments, id: :uuid do |t|
      t.references :participation, null: false, foreign_key: true, index: true, type: :uuid
      t.references :achievement, null: false, foreign_key: true, index: true, type: :uuid

      t.timestamps
    end

    add_index :accomplishments, %i[participation_id achievement_id], unique: true
  end
end
