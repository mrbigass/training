# frozen_string_literal: true

module Mutations
  class UpdateOffice < GraphQL::Schema::RelayClassicMutation
    graphql_name 'UpdateOffice'

    field :post, Types::OfficeType, null: false
    field :result, Boolean, null: false

    argument :id, ID, required: true
    argument :name, String, required: true

    def resolve(**args)
      office = Office.find(args[:id])
      office.update(**args)
      {
        office: office,
        result: office.errors.blank?
      }
    end
  end
end
