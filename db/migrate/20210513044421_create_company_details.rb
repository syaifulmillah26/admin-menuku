class CreateCompanyDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :company_details do |t|
      t.belongs_to :company
      t.integer :address_id
      t.string :npwp

      t.timestamps
    end
  end
end
