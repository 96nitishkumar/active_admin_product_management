class Category < ApplicationRecord
  has_many :products, class_name: "Product", dependent: :destroy
  has_one_attached :image

  def self.ransackable_associations(auth_object = nil)
    ["products"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["category_name", "created_at", "id", "updated_at"]
  end

end
