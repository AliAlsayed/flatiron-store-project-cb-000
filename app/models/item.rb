class Item < ActiveRecord::Base
  has_many :line_items
  has_many :carts, through: :line_items
  belongs_to :category

  def self.available_items
    Item.all.map do |item|
      if item.inventory > 0
        item
      end
    end
  end
end
