# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :createOffice, mutation: Mutations::CreateOffice
    field :updateOffice, mutation: Mutations::UpdateOffice
    field :deleteOffice, mutation: Mutations::DeleteOffice
  end
end
