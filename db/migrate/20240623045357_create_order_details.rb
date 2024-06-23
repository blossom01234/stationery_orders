class CreateOrderDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :order_details do |t|
      t.references :product, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.integer :quantity
      t.string :created_us
      t.string :updated_us
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
