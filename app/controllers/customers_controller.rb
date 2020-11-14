# frozen_string_literal: true

class CustomersController < ApplicationController
  def new; end

  def create
    customer = Customer.new(customer_params)

    redirect_to root_path if customer.save
  end

  private

  def customer_params
    params.require(:customer).permit(:name)
  end
end
