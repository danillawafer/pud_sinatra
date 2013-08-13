class CreatePlayersTable < ActiveRecord::Migration
  def change
  	create_table :players do |t|
  		t.string :username
  		t.string :password_hash
  		t.string :email
  		t.integer :wins, default: 0
  		t.integer :losses, default: 0

  		t.timestamps
  	end
  end
end
