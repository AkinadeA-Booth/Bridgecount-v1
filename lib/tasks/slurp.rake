namespace :slurp do
  desc "TODO"
  task companies: :environment do
    require "csv"

    Company.destroy_all

    csv_text = File.read(Rails.root.join("lib", "csvs", "companies.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      puts row.to_hash
      puts csv_text

      #  id           :integer          not null, primary key
      #  address      :string
      #  company_type :string
      #  image        :string
      #  name         :string
      #  created_at   :datetime         not null
      #  updated_at   :datetime

      c = Company.new
      c.id = row["id"]
      c.created_at = row["created_at"]
      c.name = row["name"]
      c.address = row["address"]
      c.image = row["image"]
      c.updated_at = row["updated_at"]
      c.company_type = row["company_type"]

      c.save

      puts "#{c.errors.full_messages}, #{c.name} saved"
    end

  end
  ####################################################################################################
  desc "TODO"
  task offers: :environment do
    require "csv"
    Offer.destroy_all

    csv_text_2 = File.read(Rails.root.join("lib", "csvs", "offers.csv"))
    csv_2 = CSV.parse(csv_text_2, :headers => true, :encoding => "ISO-8859-1")
    csv_2.each do |row|
      puts row.to_hash
      puts csv_text_2

      #  id                :integer          not null, primary key
      #  offer_description :text
      #  offer_name        :string
      #  offer_photo       :string
      #  created_at        :datetime         not null
      #  updated_at        :datetime         not null
      #  small_business_id :integer

      o = Offer.new
      o.id = row["id"]
      o.created_at = row["created_at"]
      o.offer_name = row["offer_name"]
      o.offer_description = row["offer_description"]
      o.offer_photo = row["offer_photo"]
      o.updated_at = row["updated_at"]
      o.small_business_id = row["small_business_id"]

      o.save

      puts "#{o.errors.full_messages}, #{o.offer_name} saved"
    end
  end
  ####################################################################################################
  desc "TODO"
  task users: :environment do
    require "csv"
    User.destroy_all

    csv_text_3 = File.read(Rails.root.join("lib", "csvs", "users.csv"))
    csv_3 = CSV.parse(csv_text_3, :headers => true, :encoding => "ISO-8859-1")
    csv_3.each do |row|
      puts row.to_hash
      puts csv_text_3

      #  id                          :integer          not null, primary key
      #  company_admin_true_or_false :boolean
      #  email                       :string
      #  first_name                  :string
      #  last_name                   :string
      #  password_digest             :string
      #  photo                       :string
      #  smallbiz                    :boolean
      #  created_at                  :datetime         not null
      #  updated_at                  :datetime         not null
      #  company_id                  :integer
      u = User.new
      u.id = row["id"]
      u.company_admin_true_or_false = row["company_admin_true_or_false"]
      u.email = row["email"]
      u.password = row["password"]
      u.photo = row["photo"]
      u.created_at = row["created_at"]
      u.updated_at = row["updated_at"]
      u.company_id = row["company_id"]
      u.first_name = row["first_name "]
      u.last_name = row["last_name "]
      u.smallbiz = row["small_business_owner"]

      u.save

      puts "#{u.errors.full_messages}, #{u.email} saved"
    end
  end

  ####################################################################################################
  desc "TODO"
  task smallbusinesses: :environment do
    require "csv"

    SmallBusiness.destroy_all

    csv_text_4 = File.read(Rails.root.join("lib", "csvs", "small_businesses.csv"))
    csv_4 = CSV.parse(csv_text_4, :headers => true, :encoding => "ISO-8859-1")
    csv_4.each do |row|
      puts row.to_hash
      puts csv_text_4

      # id,created_at,updated_at,small_business_name,small_business_description,small_business_location,small_business_phone_number,small_business_photo,small_business_type

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

      b = SmallBusiness.new
      b.id = row["id"]
      b.small_business_description = row["small_business_description"]
      b.small_business_location = row["small_business_location"]
      b.small_business_name = row["small_business_name"]
      b.small_business_phone_number = row["small_business_phone_number"]
      b.small_business_photo = row["small_business_photo"]
      b.small_business_type = row["small_business_type"]
      b.updated_at = row["updated_at"]
      b.created_at = row["created_at"]
      b.user_id = row["user_id"]

      b.save

      puts "#{b.errors.full_messages}, #{b.small_business_phone_number} saved"
    end
  end
end
