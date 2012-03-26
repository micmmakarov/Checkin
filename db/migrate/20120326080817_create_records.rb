class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer :type
      t.time :time
      t.float :latitude
      t.float :longtitude
      t.time :timestamp
      t.integer :accuracy
      t.text :note
      t.references :company
      t.references :user

      t.timestamps
    end
    add_index :records, :company_id
    add_index :records, :user_id
  end
end
