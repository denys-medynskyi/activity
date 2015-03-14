class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :type
      t.string :word
      t.integer :difficulty

      t.timestamps null: false
    end
  end
end
