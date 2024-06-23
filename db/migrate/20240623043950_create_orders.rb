class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.datetime :order_date
      t.integer :status
      t.decimal :total_price
      t.string :created_us
      t.string :updated_us
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
