FactoryBot.define do
  factory :order do
    order_id { "MyString" }
    status { false }
    users { nil }
    products { nil }
  end
end
