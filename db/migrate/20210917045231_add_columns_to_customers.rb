class AddColumnsToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :first_name, :string, false
    add_column :customers, :last_name, :string, false
    add_column :customers, :kana_first_name, :string, false
    add_column :customers, :kana_last_name, :string, false
    add_column :customers, :postal_code, :string, false
    add_column :customers, :address, :string, false
    add_column :customers, :phone_number, :string, false
    add_column :customers, :is_deleted, :boolean, false
  end
end