# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: User do
    office { create(:office) }
    name { 'test user' }
    password { 'password' }
  end
end
