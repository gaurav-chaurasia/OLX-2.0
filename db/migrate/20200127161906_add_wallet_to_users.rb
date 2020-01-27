class AddWalletToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :wallet, :float, default: 5000.0
  end
end
