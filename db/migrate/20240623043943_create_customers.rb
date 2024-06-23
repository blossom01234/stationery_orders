class CreateCustomers < ActiveRecord::Migration[7.1]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :first_name_kana
      t.string :last_name_kana
      t.string :organization
      t.string :created_us
      t.string :updated_us
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
