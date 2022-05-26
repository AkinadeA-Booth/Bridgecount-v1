namespace :slurp do
  
  desc "TODO"
  task transactions: :environment do
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

    puts "#{c.address}, #{c.name} saved"

    end
  end
end
