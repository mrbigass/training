# frozen_string_literal: true

class LendingsController < ApplicationController
  def new; end

  def create
    lending = Lending.new(
      office: Office.first,
      customer: Customer.first,
      machine: Machine.first,
      from: '2021-04-25 04:17:49 UTC',
      to: '2021-04-26 04:17:49 UTC'
    )

    redirect_to root_path if lending.save
  end
end
