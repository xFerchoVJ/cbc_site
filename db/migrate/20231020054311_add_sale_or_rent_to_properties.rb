class AddSaleOrRentToProperties < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :sale_or_rent, :boolean
  end
end
