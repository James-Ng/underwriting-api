FactoryGirl.define do
  factory :borrower do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    email { FFaker::Internet.email }
    credit_score 620
    base_income 1
    rental_income 1
    commission 1
  end

end
