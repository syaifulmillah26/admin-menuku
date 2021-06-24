class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.integer :user_id
      t.string :company_name
      t.belongs_to :business_type
      t.string :status

      t.timestamps
    end
  end
end
