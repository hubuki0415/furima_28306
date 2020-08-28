class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                          null: false, default: ""
      t.integer :price,                        null: false
      t.references :user,                      null: false, foreign_key: true
      t.integer :category_id,                  null: false
      t.integer :status_id,                    null: false
      t.text :explanation,                     null: false
      t.integer :burden_id,                    null: false
      t.integer :prefectures_id,               null: false
      t.integer :days_until_shipping_id
      t.timestamps
    end
  end
end
