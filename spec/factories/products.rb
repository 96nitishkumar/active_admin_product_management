FactoryBot.define do
  factory :product do
    product_name { "MyString" }
    product_cost { "9.99" }
    description { "MyString" }
    categories { nil }
  end
end
