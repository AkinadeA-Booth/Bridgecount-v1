# == Schema Information
#
# Table name: users_leveraging_accepted_offers
#
#  id                       :integer          not null, primary key
#  number_of_times_redeemed :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  accepted_offer_id        :integer
#  user_id                  :integer
#
class UsersLeveragingAcceptedOffer < ApplicationRecord

  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })

  belongs_to(:accepted_offer, { :required => true, :class_name => "AcceptedOffer", :foreign_key => "accepted_offer_id" })
end
