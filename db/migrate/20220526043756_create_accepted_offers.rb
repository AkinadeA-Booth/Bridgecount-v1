class CreateAcceptedOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :accepted_offers do |t|
      t.integer :offer_id
      t.integer :company_id
      t.datetime :offer_start
      t.datetime :offer_end
      t.integer :number_of_redeems

      t.timestamps
    end
  end
end
