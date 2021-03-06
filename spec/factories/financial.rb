require 'faker'

FactoryBot.define do 
	factory :financial do 
	franchise
	year {Date.today.year}
    acct_monthly {1000}
    acct_startup {2000}
    acct_backwork {3000}
    tax_prep {4000}
    payroll_processing {5000}
    other_consult {6000}
    payroll_operation {100}
    owner_wages {200}
    owner_payroll_taxes {300}
    payroll_taxes_ben_ee {400}
    insurance_business {500}
    supplies {600}
    legal_accounting {700}
    marketing {800}
    rent {900}
    outside_labor {1000}
    vehicles {1100}
    travel {1200}
    utilities {1300}
    licenses_taxes {1400}
    postage {1500}
    repairs {1600}
    interests {1700}
    meals_entertainment {1800}
    bank_charges {1900}
    contributions {2000}
    office {2100}
    miscellaneous {2200}
    equipment_lease {2300}
    dues_subscriptions {2400}
    bad_debt {2500}
    continuing_ed {2600}
    property_tax {2700}
    telephone_data_internet {2800}
    software {2900}
    royalties {3000}
    marketing_material {3100}
    owner_health_ins {3200}
    owner_vehicle {3300}
    owner_ira_contrib {3400}
    amortization {3500}
    depreciation {3600}
    payroll_process_fees {3700}
    other_income {3800}
    interest_income {3900}
    net_gain_asset {4000}
    casualty_gain {4100}
    other_expense {4200}
    prov_income_tax {4300}
    other1_desc {Faker::Commerce.product_name}
    other1 {4000}
    other2_desc {Faker::Commerce.product_name}
    other2 {4000}
    other3_desc {Faker::Commerce.product_name}
    other3 {4000}
    monthly_clients {200}
    total_monthly_fees {2000}
    quarterly_clients {100}
    total_quarterly_fees {3000}
  end
end
