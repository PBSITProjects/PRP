# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
=begin
(2..20).each do |fnum| 
  Franchise.create(	
    area: "1",
    mast: "0",
    region: 1,
    franchise_number: "%03d" % fnum,
    office: "01",
    firm_id: "123456",
    salutation: Faker::Name.prefix,
    lastname: Faker::Name.last_name,
    firstname: Faker::Name.first_name,
    initial: Faker::Name.middle_name[0],
    address: Faker::Address.street_address,
    address2: Faker::Address.building_number,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zip_code: Faker::Address.zip,
    email: "franchise#{fnum}@smallbizpros.com",
    ship_address: Faker::Address.street_address,
    ship_address2: "",
    ship_city: Faker::Address.city,
    ship_state: Faker::Address.state_abbr,
    ship_zip_code: Faker::Address.zip,
    home_address: Faker::Address.street_address,
    home_address2: "",
    home_city: Faker::Address.city,
    home_state: Faker::Address.state_abbr,
    home_zip_code: Faker::Address.zip,
    phone: Faker::PhoneNumber.phone_number,
    phone2: Faker::PhoneNumber.phone_number,
    fax: Faker::PhoneNumber.phone_number,
    mobile: Faker::PhoneNumber.cell_phone,
    alt_email: Faker::Internet.safe_email,
    start_date: (Date.today-1.year),
    renew_date: (Date.today+5.year),
    term_date: nil,
    term_reason: "",
    salesman: Faker::Name.name,
    territory: "Some Greater Area",
    start_zip: Faker::Address.zip,
    stop_zip: Faker::Address.zip,
    prior_year_rebate: Faker::Number.decimal(l_digits: 4, r_digits: 2),
    advanced_rebate: Faker::Number.decimal(l_digits: 1, r_digits: 1),
    show_exempt_collect: 0,
    inactive: 0,
    non_compliant: 0,
    non_compliant_reason: "",
    max_collections: 0.00,
    avg_collections: 0.00,
    max_coll_year: 0,
    max_coll_month: 0)
end
=end

Region.create({ "region_id"=>1, "region_number"=>"01", "area"=>"1", "description"=>"Southeast"})
Region.create({ "region_id"=>2, "region_number"=>"02", "area"=>"1", "description"=>"Mid-Atlantic"})
Region.create({ "region_id"=>3, "region_number"=>"03", "area"=>"1", "description"=>"Northeast Corridor"})
Region.create({ "region_id"=>4, "region_number"=>"04", "area"=>"1", "description"=>"Mid-US"})
Region.create({ "region_id"=>5, "region_number"=>"05", "area"=>"1", "description"=>"PBS West"})
Region.create({ "region_id"=>19, "region_number"=>"19", "area"=>"1", "description"=>"Processing Centers"})
Region.create({ "region_id"=>20, "region_number"=>"20", "area"=>"1", "description"=>"Corporate"})
Region.create({ "region_id"=>0, "region_number"=>"00", "area"=>"1", "description"=>"Home Office"})