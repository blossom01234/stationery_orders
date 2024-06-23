class CreateMakers < ActiveRecord::Migration[7.1]
  def change
    create_table :makers do |t|
      t.string :name
      t.string :created_us
      t.string :updated_us
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
