class Product < ApplicationRecord
  belongs_to :categories, class_name: 'Category'
  has_many :orders, class_name: 'Order'
  has_many_attached :images
  validates :product_name, presence: true
  validates :product_cost, presence: true, length: { in:0..10}

  def self.ransackable_associations(auth_object = nil)
    ["categories", "orders"]
  end
  
  def self.ransackable_attributes(auth_object = nil)
    ["categories_id", "created_at", "description", "id", "product_cost", "product_name", "updated_at"]
  end

  
end
