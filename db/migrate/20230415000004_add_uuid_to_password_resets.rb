class AddUuidToPasswordResets < ActiveRecord::Migration[7.0]
  def up
    add_column :password_resets, :uuid, :string, null: false, limit: 255
  end

  def down
    remove_column :password_resets, :uuid
  end
end