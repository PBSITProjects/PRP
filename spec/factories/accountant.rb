require 'faker'
Faker::Config.locale = 'en-US'

FactoryBot.define do
  factory :accountant do 
    franchise
    sequence(:accountant_num) {|n| "%02d" % n}
    lastname {Faker::Name.last_name}
    firstname {Faker::Name.first_name}
    initial {Faker::Name.middle_name[0]}
    salutation {""}
    birthdate {(Date.today-40.year)}
    spouse_name {Faker::Name.name}
    spouse_birthdate {(Date.today-35.year)}
    spouse_partner {1}
    start_date {(Date.today-10.year)}
    inactive {0}
    term_date {nil}
    cpa {1}
    mba {1}
    degree {1}
    agent {0}
    advisory_board {0}
    notes {Faker::Lorem.paragraphs(number: 2)}
  end


end