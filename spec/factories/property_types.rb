FactoryGirl.define do
  factory :property_type do
    name { FFaker::Name.name }
    is_active false
  end
end
