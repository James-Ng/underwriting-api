FactoryGirl.define do
  factory :borrower do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    email { FFaker::Internet.email }
    credit_score 620
    base_income 10
    rental_income 10
    commission 10
    # address
    full_address { FFaker::AddressAU.full_address }
    mortgage_payment 1.5
    mortgage_insurance 1.5
    homeowner_insurance 1.5
    property_tax 1.5
    HOA_due 1.5
  end
end
