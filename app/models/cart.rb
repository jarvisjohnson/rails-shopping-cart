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

  def subtotal
    subtotal = 0
    line_items.each do |line_item|
      subtotal += line_item.total
    end
    subtotal
  end

  def discount
    if subtotal > 100
      {rate: 0.2, message: "20% off on total greater than $100"}
    elsif subtotal > 50
      {rate: 0.15, message: "15% off on total greater than $50"}
    elsif subtotal > 20
      {rate: 0.1, message: "10% off on total greater than $20"}
    else
      {rate: 0.0, message: ""}
    end
  end

  def total
    subtotal - (discount[:rate] * subtotal)
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
