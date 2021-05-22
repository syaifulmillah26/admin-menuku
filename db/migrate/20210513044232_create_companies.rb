class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :uuid, primary: true, null: false
      t.string :user_id
      t.belongs_to :business_type
      t.string :company_name
      t.string :status

      t.timestamps
    end
  end
end
