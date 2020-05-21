class DropWorkoutsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :workouts
  end
end
