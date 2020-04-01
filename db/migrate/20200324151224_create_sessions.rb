class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.integer :coach_id
      t.integer :player_id
      t.string :session_date
      t.string :session_time
    end
  end
end
