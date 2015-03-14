class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.json :teams# [{team: 'A' , players: ['den', 'bond'], current_player: 0}]
      t.integer :current_team, default: 0
      t.timestamps null: false
    end
  end
end
