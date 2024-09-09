class CreateTryns < ActiveRecord::Migration[7.0]
  def change
    create_table :tryns do |t|
      t.string :name
      t.string :description
      t.decimal :price

      t.timestamps
    end
  end
end
