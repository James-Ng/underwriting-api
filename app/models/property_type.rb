class PropertyType < ActiveRecord::Base
  validates :name, presence: true

  has_many :borrowers
end
