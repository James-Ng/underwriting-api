class Borrower < ActiveRecord::Base

  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :credit_score, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 620 }
  validates :base_income, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :rental_income, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :commission, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, message: "Sorry, your credit score is below the minimum required to obtain a mortgage." }

  def total_income
    self.base_income + self.rental_income + self.commission
  end
end
