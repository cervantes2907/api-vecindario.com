FactoryBot.define do
  factory :comment do
    name { "MyString" }
    content { "MyText" }
    email_user { "MyString" }
    post { nil }
  end
end
