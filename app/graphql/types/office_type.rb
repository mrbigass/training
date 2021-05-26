# frozen_string_literal: true

module Types
  class OfficeType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :users, [Types::UserType], null: false
    field :machines, [Types::MachineType], null: false
  end
end
