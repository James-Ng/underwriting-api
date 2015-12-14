require 'rails_helper'

RSpec.describe Borrower, :type => :model do
  before {
    @property_type = FactoryGirl.create(:property_type, is_active: true)
    @borrower = FactoryGirl.build(:borrower)
    @borrower.property_type_id = @property_type.id
  }

  subject { @borrower }

  it { should respond_to(:first_name) }
  it { should validate_presence_of(:first_name) }

  it { should respond_to(:last_name) }
  it { should validate_presence_of(:last_name) }

  it { should respond_to(:email) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should allow_value('jamesnguyevnn@gmail.com').for(:email) }
  it { should_not allow_value('jamesnguyevnn').for(:email) }
  it { should_not allow_value('jamesnguyevnn@gmail.com.').for(:email) }

  it { should respond_to(:credit_score) }
  it { should validate_presence_of(:credit_score) }
  it { should validate_numericality_of(:credit_score).is_greater_than_or_equal_to(620).only_integer.with_message(I18n.t('errors.borrower.low_credit_score')) }
  it { should_not allow_value(1).for(:credit_score)}

  it { should respond_to(:base_income) }
  it { should validate_presence_of(:base_income) }
  it { should validate_numericality_of(:base_income).is_greater_than_or_equal_to(0).only_integer }

  it { should respond_to(:rental_income) }
  it { should validate_presence_of(:rental_income) }
  it { should validate_numericality_of(:rental_income).is_greater_than_or_equal_to(0).only_integer }

  it { should respond_to(:commission) }
  it { should validate_presence_of(:commission) }
  it { should validate_numericality_of(:commission).is_greater_than_or_equal_to(0).only_integer }

  # address
  it { should respond_to(:full_address) }
  it { should validate_presence_of(:full_address) }

  it { should respond_to(:mortgage_payment) }
  it { should validate_presence_of(:mortgage_payment) }
  it { should validate_numericality_of(:mortgage_payment).is_greater_than_or_equal_to(0) }

  it { should respond_to(:mortgage_insurance) }
  it { should validate_presence_of(:mortgage_insurance) }
  it { should validate_numericality_of(:mortgage_insurance).is_greater_than_or_equal_to(0) }

  it { should respond_to(:homeowner_insurance) }
  it { should validate_presence_of(:homeowner_insurance) }
  it { should validate_numericality_of(:homeowner_insurance).is_greater_than_or_equal_to(0) }

  it { should respond_to(:property_tax) }
  it { should validate_presence_of(:property_tax) }
  it { should validate_numericality_of(:property_tax).is_greater_than_or_equal_to(0) }

  it { should respond_to(:HOA_due) }
  it { should validate_presence_of(:HOA_due) }
  it { should validate_numericality_of(:HOA_due).is_greater_than_or_equal_to(0) }

  # Custom validation
  it 'validates that approved ratio' do
    @borrower.base_income = 1
    should_not be_valid
    expect(@borrower.errors[:base].size).to eq(1)
    expect(@borrower.errors[:base]).to include I18n.t('errors.borrower.high_ratio')
  end

  # associations
  it { should belong_to(:property_type)}
  it { should validate_presence_of :property_type_id }

  it { should be_valid }
  it 'validates associations when property_type not exist' do
    @borrower.property_type_id = 13123
    should_not be_valid
  end

  it 'validates property_type not actived' do
    @borrower.property_type.is_active = false
    should_not be_valid
    expect(@borrower.errors[:property_type].size).to eq(1)
    expect(@borrower.errors[:property_type]).to include I18n.t('errors.borrower.property_eligibility')
  end
end
