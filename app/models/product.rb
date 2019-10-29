# == Schema Information
#
# Table name: products
#
#  uuid       :integer          not null, primary key
#  name       :string
#  price      :decimal(8, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Product < ApplicationRecord
  self.primary_key = :uuid

  # Associations
  has_many :line_items

  # Validations
  validates :name, presence: true, uniqueness: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
end
