# == Schema Information
#
# Table name: products
#
#  name       :string
#  uuid       :integer
#  price      :decimal(8, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
end
