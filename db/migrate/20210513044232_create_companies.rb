class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.belongs_to :user
      t.belongs_to :business_type
      t.string :company_name
      t.string :status

      t.timestamps
    end
  end
end
