class AddQrCodeToOutlets < ActiveRecord::Migration[6.1]
  def change
    add_column :outlets, :qr_code, :string
  end
end
