class CreateSmallBusinesses < ActiveRecord::Migration[6.0]
  def change
    create_table :small_businesses do |t|
      t.string :small_business_name
      t.text :small_business_description
      t.string :small_business_location
      t.integer :small_business_phone_number
      t.string :small_business_photo
      t.string :small_business_type

      t.timestamps
    end
  end
end
