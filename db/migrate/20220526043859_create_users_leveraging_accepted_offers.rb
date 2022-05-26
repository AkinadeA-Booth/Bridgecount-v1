class CreateUsersLeveragingAcceptedOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :users_leveraging_accepted_offers do |t|
      t.integer :user_id
      t.integer :accepted_offer_id
      t.string :number_of_times_redeemed

      t.timestamps
    end
  end
end
