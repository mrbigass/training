# frozen_string_literal: true

module Types
  class MachineType < Types::BaseObject
    field :id, ID, null: false
    field :office, Types::OfficeType, null: false
    field :name, String, null: false
  end
end
