# == Schema Information
#
# Table name: small_businesses
#
#  id                          :integer          not null, primary key
#  small_business_description  :text
#  small_business_location     :string
#  small_business_name         :string
#  small_business_phone_number :integer
#  small_business_photo        :string
#  small_business_type         :string
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  user_id                     :integer
#
class SmallBusiness < ApplicationRecord

  has_many(:offers, { :class_name => "Offer", :foreign_key => "small_business_id", :dependent => :destroy })

  validates(:small_business_photo, { :presence => true })

  validates(:small_business_phone_number, { :presence => true })

  validates(:small_business_name, { :presence => true })

  validates(:small_business_location, { :presence => true })

  validates(:small_business_location, { :uniqueness => true })

  validates(:small_business_description, { :presence => true })
end
