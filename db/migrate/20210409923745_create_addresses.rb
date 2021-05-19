class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :address1
      t.string :address2
      t.string :zipcode
      t.string :phone
      t.string :alternative_phone
      t.belongs_to :province
      t.belongs_to :city
      t.belongs_to :subdistrict

      t.timestamps
    end
  end
end
