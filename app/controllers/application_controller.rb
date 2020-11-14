# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def current_office
    @current_office ||= current_user.office
  end

  def home
    @offices = Office.all
    @machines = Machine.all
    @customers = Customer.all
  end
end
