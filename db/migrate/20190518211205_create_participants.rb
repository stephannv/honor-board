class CreateParticipants < ActiveRecord::Migration[6.0]
  def change
    create_table :participants, id: :uuid do |t|
      t.citext :username, null: false, unique: true, index: true

      t.timestamps
    end
  end
end
