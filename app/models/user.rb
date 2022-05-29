# == Schema Information
#
# Table name: users
#
#  id                          :integer          not null, primary key
#  company_admin_true_or_false :boolean
#  email                       :string
#  first_name                  :string
#  last_name                   :string
#  password_digest             :string
#  photo                       :string
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  company_id                  :integer
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many(:users_leveraging_accepted_offers, { :class_name => "UsersLeveragingAcceptedOffer", :foreign_key => "user_id", :dependent => :destroy })

  belongs_to(:company, { :required => true, :class_name => "Company", :foreign_key => "company_id" })

  validates(:company_admin_true_or_false, { :presence => true })
end
