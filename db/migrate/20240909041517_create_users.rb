class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.timestamps
      t.string :email, null: false
      t.string :password, null: false
      t.string :session_token
      t.datetime :session_expiry

      t.index :email, unique: true
      t.index :session_token, unique: true
    end
  end
end