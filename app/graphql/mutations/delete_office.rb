# frozen_string_literal: true

module Mutations
  class DeleteOffice < GraphQL::Schema::RelayClassicMutation
    graphql_name 'DeleteOffice'

    field :result, Boolean, null: false

    argument :id, ID, required: true

    def resolve(**args)
      office = Office.find(args[:id])
      office.destroy
      {
        result: office.errors.blank?
      }
    end
  end
end
