class AddPropertyTypeIdToBorrower < ActiveRecord::Migration
  def change
    add_reference :borrowers, :property_type, index: true, foreign_key: true
  end
end
