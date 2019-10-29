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
end
