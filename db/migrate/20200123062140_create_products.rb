class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :cost
      t.integer :age
      t.string :address
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
