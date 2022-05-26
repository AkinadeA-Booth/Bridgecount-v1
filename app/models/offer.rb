# == Schema Information
#
# Table name: offers
#
#  id                :integer          not null, primary key
#  offer_description :text
#  offer_name        :string
#  offer_photo       :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  small_business_id :integer
#
class Offer < ApplicationRecord

  has_many(:accepted_offers, { :class_name => "AcceptedOffer", :foreign_key => "offer_id", :dependent => :destroy })

  belongs_to(:small_business, { :required => true, :class_name => "SmallBusiness", :foreign_key => "small_business_id" })

  validates(:offer_photo, { :presence => true })

  validates(:offer_name, { :presence => true })

  validates(:offer_description, { :presence => true })

end
