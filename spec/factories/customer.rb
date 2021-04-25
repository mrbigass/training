# frozen_string_literal: true

FactoryBot.define do
  factory :customer, class: Customer do
    name { Faker::Name.name }
  end
end
