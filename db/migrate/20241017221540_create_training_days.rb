class CreateTrainingDays < ActiveRecord::Migration[7.1]
  def change
    create_table :training_days do |t|
      t.integer :free_throws_scored
      t.integer :two_point_shots_scored
      t.integer :three_points_shots_scored
      t.integer :free_throws_totals
      t.integer :two_point_shots_totals
      t.integer :three_points_shots_totals
      t.date :training_date
      
      t.references :player, null: false, foreign_key: true

      t.timestamps
    end
  end
end
