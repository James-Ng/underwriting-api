require 'rails_helper'

RSpec.describe Borrower, :type => :model do
  before { @borrower = FactoryGirl.build(:borrower) }

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
  it { should validate_numericality_of(:credit_score).is_greater_than_or_equal_to(620).only_integer }
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

  it { expect(@borrower.total_income).to eql 3 }
  it { expect(@borrower.total_income).to_not eql 4 }

  it { should be_valid }
end
