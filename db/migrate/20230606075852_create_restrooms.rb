class CreateRestrooms < ActiveRecord::Migration[7.0]
  def change
    create_table :restrooms do |t|
      t.string :name
      t.string :address
      t.boolean :accessibility
      t.boolean :hygiene_products
      t.boolean :baby_friendly
      t.string :photo
      t.integer :pricing
      t.boolean :cleanliness
      t.float :longitude
      t.float :latitude
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
