class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :genre_id
      t.string :image_id
      t.string :name
      t.text :description
      t.integer :tax_out_price
      t.boolean :sales_status

      t.timestamps
    end
  end
end
