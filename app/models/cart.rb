# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cart < ApplicationRecord
  # Associations
  has_many :line_items, dependent: :destroy

  def total
    total = 0
    line_items.each do |line_item|
      total += line_item.total
    end
    total
  end

  def add_product(product)
    line_item = line_items.find_by(product_id: product.id)
    if line_item
      line_item.quantity += 1
    else
      line_item = line_items.build(product: product)
    end
    line_item
  end

  def item_count
    count = 0
    line_items.each do |line_item|
      count += line_item.quantity
    end
    count
  end
end
