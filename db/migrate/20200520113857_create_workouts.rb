class CreateWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :workouts do |t|
      t.string :client_id
      t.string :integer
      t.string :notes
      t.datetime :date
      t.datetime :startDate
      t.datetime :endDate
      t.integer :user_id

      t.timestamps
    end
  end
end
