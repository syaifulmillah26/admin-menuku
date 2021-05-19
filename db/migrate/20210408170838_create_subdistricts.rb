class CreateSubdistricts < ActiveRecord::Migration[6.1]
  def change
    create_table :subdistricts do |t|
      t.integer :city_id
      t.string :subdistrict_name

      t.timestamps
    end
  end
end
