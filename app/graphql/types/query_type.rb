# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

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
  end
end