class CreateGamesTable < ActiveRecord::Migration
  def change
  	create_table :games do |t|
  		t.integer :player1_id
  		t.integer :player2_id
  		t.integer :time
  		t.integer :winner
  		t.integer :loser

  		t.timestamps
  	end
  end
end
