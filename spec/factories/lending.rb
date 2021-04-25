# frozen_string_literal: true

FactoryBot.define do
  factory :lending, class: Lending do
    office { create(:office) }
    machine { create(:machine) }
    customer { create(:customer) }
    from { Faker::Date.birthday }
    to { from + Random.rand(1..14).days }
  end
end
