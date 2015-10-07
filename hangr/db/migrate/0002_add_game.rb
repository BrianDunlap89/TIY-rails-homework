class AddGame < ActiveRecord::Migration
  def up
    create_table :games do |t|
      t.string :player
      t.boolean :game_over
      t.integer :guesses
      t.string :answer
    end
  end

  def down
    drop_table :games
  end
end