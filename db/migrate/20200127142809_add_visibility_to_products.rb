class AddVisibilityToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :visibility, :boolean
  end
end
