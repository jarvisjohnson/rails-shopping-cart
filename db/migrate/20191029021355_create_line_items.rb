class CreateLineItems < ActiveRecord::Migration[6.0]
  def change
    create_table :line_items do |t|
      # t.references :product, null: false, foreign_key: true, column: :user_id, primary_key: "product_id"
      t.integer :product_id
      t.belongs_to :cart, null: false, foreign_key: true
      t.integer :quantity, default: 1

      t.timestamps
    end

    add_foreign_key :line_items, :products, column: :product_id, primary_key: "uuid"
  end
end
