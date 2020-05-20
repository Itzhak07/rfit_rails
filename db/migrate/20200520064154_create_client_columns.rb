class CreateClientColumns < ActiveRecord::Migration[6.0]
  def change
    add_column :clients, :password, :string, { null: false, default: "RFit7707" }
    add_column :clients, :phone, :string
    add_column :clients, :status, :integer, { null: false, default: 1}
    add_column :clients, :gender, :string
    add_column :clients, :avatar, :string, { null:false, default: "http://www.gravatar.com/avatar/b642b4217b34b1e8d3bd915fc65c4452?s=200&r=pg&d=mm"}
  end
end
