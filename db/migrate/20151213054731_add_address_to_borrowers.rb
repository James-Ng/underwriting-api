class AddAddressToBorrowers < ActiveRecord::Migration
  def change
    add_column :borrowers, :full_address, :string
    add_column :borrowers, :mortgage_payment, :float
    add_column :borrowers, :mortgage_insurance, :float
    add_column :borrowers, :homeowner_insurance, :float
    add_column :borrowers, :property_tax, :float
    add_column :borrowers, :HOA_due, :float
  end
end
