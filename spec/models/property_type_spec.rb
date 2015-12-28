require 'rails_helper'

RSpec.describe PropertyType, :type => :model do
  before { @property_type = FactoryGirl.build(:property_type) }

  subject { @property_type }

  it { should respond_to(:name) }
  it { should validate_presence_of(:name) }

  it { should respond_to(:is_active) }

  # associations
  it { should have_many(:borrowers)}

  it { should be_valid }
end
