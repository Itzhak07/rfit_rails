class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :firstName
      t.string :lastName
      t.string :email
      t.integer :user_id

      t.timestamps
    end
  end
end
