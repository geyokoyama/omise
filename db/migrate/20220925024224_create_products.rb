class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title, null: false, limit: 100
      t.decimal :price, null: false, precision: 8, scale: 2
      t.text :description, limit: 501
      t.string :brand, null: false

      t.timestamps
    end
  end
end
