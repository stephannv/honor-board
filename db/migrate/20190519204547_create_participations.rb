class CreateParticipations < ActiveRecord::Migration[6.0]
  def change
    create_table :participations, id: :uuid do |t|
      t.references :participant, null: false, index: true, foreign_key: true, type: :uuid
      t.references :season, null: false, index: true, foreign_key: true, type: :uuid

      t.timestamps
    end

    add_index :participations, %i[participant_id season_id], unique: true
  end
end
