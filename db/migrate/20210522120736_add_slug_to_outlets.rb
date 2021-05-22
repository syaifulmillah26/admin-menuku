class AddSlugToOutlets < ActiveRecord::Migration[6.1]
  def change
    add_column :outlets, :slug, :string
    add_index :outlets, :slug, unique: true
  end
end
