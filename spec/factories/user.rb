# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: User do
    office { create(:office) }
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 8) }
  end
end
