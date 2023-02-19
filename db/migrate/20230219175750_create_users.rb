# CreateUsers creates the users table
class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :surname, null: false
      t.citext :email, null: false
      t.string :password_digest, null: false

      t.timestamps
    end
    add_index :users,
      :email,
      name: "index_users_email_unique",
      unique: true
  end
end
