# == Schema Information
#
# Table name: accepted_offers
#
#  id                :integer          not null, primary key
#  number_of_redeems :integer
#  offer_end         :datetime
#  offer_start       :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  company_id        :integer
#  offer_id          :integer
#
class AcceptedOffer < ApplicationRecord

  belongs_to(:company, { :required => true, :class_name => "Company", :foreign_key => "company_id" })

  has_many(:users_leveraging_accepted_offers, { :class_name => "UsersLeveragingAcceptedOffer", :foreign_key => "accepted_offer_id", :dependent => :destroy })

  belongs_to(:offer, { :required => true, :class_name => "Offer", :foreign_key => "offer_id" })

  validates(:offer_start, { :presence => true })

  validates(:offer_end, { :presence => true })
end
