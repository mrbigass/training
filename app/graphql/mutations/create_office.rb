# frozen_string_literal: true

module Mutations
  class CreateOffice < GraphQL::Schema::RelayClassicMutation
    graphql_name 'CreateOffice'

    field :office, Types::OfficeType, null: false
    field :result, Boolean, null: false

    argument :name, String, required: true

    def resolve(**args)
      office = Office.create(**args)

      {
        office: office,
        result: office.errors.blank?
      }
    end
  end
end
