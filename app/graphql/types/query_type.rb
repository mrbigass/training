# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`

    field :offices, [Types::OfficeType], null: false
    def offices
      Office.all
    end

    field :office, Types::OfficeType, null: false do
      argument :id, Int, required: false
    end
    def office(id:)
      Office.find(id)
    end

    field :users, [Types::UserType], null: false
    def users
      current_user.office.users
    end

    field :user, Types::UserType, null: false do
      argument :id, Int, required: false
    end
    def user(id:)
      User.find(id)
    end

    field :machines, [Types::MachineType], null: false
    def machines
      Machine.all
    end

    field :machine, Types::MachineType, null: false
    def machine(id:)
      Machine.find(id)
    end
  end
end
