class CreateKais < ActiveRecord::Migration[7.0]
  def change
    create_table :kais do |t|
      t.string :name
      t.string :description
      t.decimal :price

      t.timestamps
    end
  end
end
