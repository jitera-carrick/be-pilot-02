class AddUuidToLoginAttempts < ActiveRecord::Migration[7.0]
  def up
    add_column :login_attempts, :uuid, :string, limit: 255
  end

  def down
    remove_column :login_attempts, :uuid
  end
end