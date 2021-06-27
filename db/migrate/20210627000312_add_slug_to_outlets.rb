class AddSlugToOutlets < ActiveRecord::Migration[6.1]
  def change
    add_column :outlets, :slug, :string
  end
end
