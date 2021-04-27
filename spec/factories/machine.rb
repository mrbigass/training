# frozen_string_literal: true

FactoryBot.define do
  factory :machine, class: Machine do
    office { create(:office) }
    name { Faker::Vehicle.make }
  end
end
