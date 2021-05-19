class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :registration_id
      t.string :company_name
      t.string :status

      t.timestamps
    end
  end
end
