class CreateLoginAttempts < ActiveRecord::Migration[7.0]
  def change
    create_table :login_attempts do |t|
      t.datetime :attempted_at
      t.boolean :successful
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end