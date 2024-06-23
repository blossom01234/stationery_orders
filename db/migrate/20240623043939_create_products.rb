class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.references :maker, null: false, foreign_key: true
      t.string :name
      t.integer :jancode
      t.string :product_code
      t.decimal :price
      t.integer :unit
      t.string :note
      t.string :created_us
      t.string :updated_us
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
