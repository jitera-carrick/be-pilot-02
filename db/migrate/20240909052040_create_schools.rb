class CreateSchools < ActiveRecord::Migration[7.0]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :description
      t.decimal :price

      t.timestamps
    end
  end
end
