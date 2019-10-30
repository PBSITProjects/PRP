require 'faker'
FactoryBot.define do 
  factory :user do 
  	franchise
  	sequence(:email) {|n| "user#{n}@example.com"}
  	password {Faker::Internet.password}
  	role {:full_control}
  	trait :user_can_pay do 
  	  role {:can_pay}
  	end

  	trait :data_entry_only do 
  		role {:data_entry}
  	end

  end

end