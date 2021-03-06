# == Schema Information
#
# Table name: line_items
#
#  id         :integer          not null, primary key
#  product_id :integer
#  cart_id    :integer          not null
#  quantity   :integer          default("1")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class LineItem < ApplicationRecord
  # Associations
  belongs_to :product
  belongs_to :cart

  def total
    product.price * quantity
  end
end
