class CreateCities < ActiveRecord::Migration[6.1]
  def change
    create_table :cities do |t|
      t.integer :province_id
      t.string :city_name
      t.string :postal_code

      t.timestamps
    end
  end
end
