class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.float :latitude
      t.float :longtitude
      t.string :address
      t.text :note

      t.timestamps
    end
  end
end
