class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :product_name,         null: false, default: ""
      t.text :description,            null: false
      t.integer :category_id,         null: false
      t.integer :condition_id ,       null: false
      t.integer :shipping_charges_id, null: false
      t.integer :state_id,            null: false
      t.integer :shipping_days_id ,   null: false
      t.integer :price ,              null: false
      t.references :user,             null: false, foreign_key:true

      t.timestamps
    end
  end
end
