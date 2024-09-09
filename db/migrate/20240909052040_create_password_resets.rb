class CreatePasswordResets < ActiveRecord::Migration[7.0]
  def change
    create_table :password_resets do |t|
      t.datetime :requested_at
      t.string :token
      t.datetime :expires_at
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end