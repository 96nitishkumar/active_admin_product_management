class Order < ApplicationRecord
  belongs_to :users, class_name: 'User'
  belongs_to :products, class_name: 'Product'
  validates :amount, presence: true, length: { in: 0..10 }
  validates :order_id, presence: true, format: { with: /[\w]/}
  # validates :age, presence: true, if::child?
  # def child?
  #   age < 18 
  # end

  def self.ransackable_associations(auth_object = nil)
    ["products", "users"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["amount", "created_at", "id", "order_id", "products_id", "status", "updated_at", "users_id"]
  end
end
