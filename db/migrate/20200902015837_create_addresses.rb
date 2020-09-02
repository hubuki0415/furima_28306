class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :postal_code,         null: false
      t.string     :phone_number,        null: false
      t.string     :municipalities,      null: false
      t.string     :street_addresses,    null: false
      t.string     :building_name
      t.references :purchase,            null: false, foreign_key: true
      t.integer    :prefectures_id,      null: false
      t.timestamps
    end
  end
end
