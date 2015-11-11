class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :alt_phone
      t.string :email
      t.string :emergency_contact_name
      t.string :emergency_contact_phone
      t.boolean :evac_waiver

      t.timestamps null: false
    end
  end
end
