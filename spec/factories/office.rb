# frozen_string_literal: true

FactoryBot.define do
  factory :office, class: Office do
    name { Faker::Company.name }
  end
end
