class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :direction
      t.decimal :price
      t.integer :square_meter
      t.integer :beds
      t.integer :bathrooms
      t.integer :property_type

      t.timestamps
    end
  end
end
