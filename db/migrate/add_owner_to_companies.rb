class AddAddressToLists < ActiveRecord::Migration
  def change
    change_table :companies do |t|
      t.integer :owner
    end
    
    add_column :companies, :owner, :integer
  end
end