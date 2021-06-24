class CreateOutlets < ActiveRecord::Migration[6.1]
  def change
    create_table :outlets do |t|
      t.integer :company_id
      t.integer :address_id
      t.string :name
      t.string :status

      t.timestamps
    end
  end
end
