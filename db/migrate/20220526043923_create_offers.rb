class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.string :offer_name
      t.text :offer_description
      t.integer :small_business_id
      t.string :offer_photo

      t.timestamps
    end
  end
end
