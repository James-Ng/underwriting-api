class Borrower < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :first_name, presence: true
  validates :last_name, presence: true
  # TODO: create a constant for 620
  validates :credit_score, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 620, message: I18n.t('errors.borrower.low_credit_score') }
  validates :base_income, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :rental_income, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :commission, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # address
  validates :mortgage_payment, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :mortgage_insurance, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :homeowner_insurance, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :property_tax, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :HOA_due, presence: true, numericality: { greater_than_or_equal_to: 0 }

  validates :full_address, presence: true

  # Custom validation
  validate :housing_expense_ratio
  validate :check_property_eligibility

  # associations
  belongs_to :property_type

  # validates associations
  validates :property_type_id, presence: true
  validates :property_type, associated: true, presence: true

  private

  # enhancement for checking property_type
  def check_property_eligibility
    errors.add(:property_type, I18n.t('errors.borrower.property_eligibility')) unless property_type && property_type.is_active
  end

  # approved or not for offering loan programs
  def housing_expense_ratio
    ratio = housing_expense / total_income
    # TODO: create a constant for 0.28
    errors.add(:base, I18n.t('errors.borrower.high_ratio')) if ratio > 0.28
  end

  # formula to calc total_income
  def total_income
    base_income.to_i + rental_income.to_i + commission.to_i
  end

  # formula to calc housing_expense
  def housing_expense
    mortgage_payment.to_f + mortgage_insurance.to_f + homeowner_insurance.to_f + property_tax.to_f + self.HOA_due.to_f
  end
end
