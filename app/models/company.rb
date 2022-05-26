# == Schema Information
#
# Table name: companies
#
#  id           :integer          not null, primary key
#  address      :string
#  company_type :string
#  image        :string
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Company < ApplicationRecord

  has_many(:users, { :class_name => "User", :foreign_key => "company_id", :dependent => :destroy })

  has_many(:accepted_offers, { :class_name => "AcceptedOffer", :foreign_key => "company_id", :dependent => :destroy })

  validates(:name, { :presence => true })

  validates(:address, { :presence => true })
end
