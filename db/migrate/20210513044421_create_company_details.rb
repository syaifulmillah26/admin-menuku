class CreateCompanyDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :company_details do |t|
      t.string :company_id
      t.integer :address_id
      t.string :npwp
      t.integer :data_filled, default: 0

      t.timestamps
    end
  end
end
