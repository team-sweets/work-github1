class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :genre_id, null: false
      t.string :image_id, null: false
      t.string :name, null: false
      t.text :description, null: false
      t.integer :tax_out_price, null: false
      t.boolean :sales_status, null: false, default: fals

      t.timestamps
    end
  end
end
