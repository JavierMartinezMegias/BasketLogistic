class CreatePlayers < ActiveRecord::Migration[7.1]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :height
      t.integer :wingspan
      t.integer :weight
      t.date :birthday
      t.integer :dorsal
      t.string :position
      
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
