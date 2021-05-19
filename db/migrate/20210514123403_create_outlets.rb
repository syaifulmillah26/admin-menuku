class CreateOutlets < ActiveRecord::Migration[6.1]
  def change
    create_table :outlets do |t|
      t.belongs_to :company
      t.integer :address_id
      t.string :name
      t.string :status

      t.timestamps
    end
  end
end
