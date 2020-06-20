FactoryBot.define do
  factory :comment do
    content { "MyString" }
    user { nil }
    microposts { nil }
  end
end
