class CreateWorkSets < ActiveRecord::Migration[6.0]
  def change
    create_table :work_sets do |t|
      t.integer :movement_id
      t.integer :workout_id
      t.integer :rounds
      t.integer :reps
      t.integer :weight

      t.timestamps
    end
  end
end
