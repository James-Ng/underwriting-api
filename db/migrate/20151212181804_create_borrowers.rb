class CreateBorrowers < ActiveRecord::Migration
  def change
    create_table :borrowers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :credit_score
      t.integer :base_income
      t.integer :rental_income
      t.integer :commission

      t.timestamps null: false
    end
  end
end

class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :address
      t.float :mortgage_payment
      t.float :mortgage_insurance
      t.float :homeower_insurance
      t.float :property_tax
      t.float :HOA_due

      t.timestamps null: false
    end
  end
end

class AddPropertyTypeIdToAddress < ActiveRecord::Migration
  def change
    add_reference :addresses, :property_type, index: true, foreign_key: true
  end
end

class AddAddressIdToBorrower < ActiveRecord::Migration
  def change
    add_reference :borrowers, :address, index: true, foreign_key: true
  end
end
