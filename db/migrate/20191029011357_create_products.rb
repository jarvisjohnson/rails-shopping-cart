class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products, id: false do |t|
      t.string :name
      t.integer :uuid, primary_key: true
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
      t.index :uuid, unique: true
    end
  end
end
