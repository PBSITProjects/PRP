require 'faker'
Faker::Config.locale = 'en-US'

FactoryBot.define do
  factory :franchise do 
    area {"1"}
    mast {"0"}
    region {1}
    sequence(:franchise_number) {|n| "%03d" % n}
    office {"01"}
    firm_id {"123456"}
    salutation {Faker::Name.prefix}
    lastname {Faker::Name.last_name}
    firstname {Faker::Name.first_name}
    initial {Faker::Name.middle_name[0]}
    address {Faker::Address.street_address}
    address2 {Faker::Address.building_number}
    city {Faker::Address.city}
    state {Faker::Address.state_abbr}
    zip_code {Faker::Address.zip}
    email {("#{firstname}#{lastname}@smallbizpros.com".downcase).gsub("'","")}
    ship_address {Faker::Address.street_address}
    ship_address2 {""}
    ship_city {Faker::Address.city}
    ship_state {Faker::Address.state_abbr}
    ship_zip_code {Faker::Address.zip}
    home_address {Faker::Address.street_address}
    home_address2 {""}
    home_city {Faker::Address.city}
    home_state {Faker::Address.state_abbr}
    home_zip_code {Faker::Address.zip}
    phone {Faker::PhoneNumber.phone_number}
    phone2 {Faker::PhoneNumber.phone_number}
    fax {Faker::PhoneNumber.phone_number}
    mobile {Faker::PhoneNumber.cell_phone}
    alt_email {Faker::Internet.safe_email}
    start_date {(Date.today-1.year)}
    renew_date {(Date.today+5.year)}
    term_date {nil}
    term_reason {""}
    salesman {Faker::Name.name}
    territory {"Some Greater Area"}
    start_zip {Faker::Address.zip}
    stop_zip {Faker::Address.zip}
    prior_year_rebate {Faker::Number.decimal(l_digits: 4, r_digits: 2)}
    advanced_rebate {Faker::Number.decimal(l_digits: 1, r_digits: 1)}
    show_exempt_collect {0}
    inactive {0}
    non_compliant {0}
    non_compliant_reason {""}
    max_collections {0.00}
    avg_collections {0.00}
    max_coll_year {0}
    max_coll_month {0}
    created_at {DateTime.now}
    updated_at {DateTime.now}
    trait :show_exempt do 
      show_exempt_collect {1}
    end

    trait :inactive do 
      inactive {1}
    end

    trait :not_compliant do 
      non_compliant {1}    
      non_compliant_reason {"Did not pay royalties over 1 year"}
    end

  end


end