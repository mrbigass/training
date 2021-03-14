# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include UserAuthentications
  before_action :check_authentication, only: %i[home]

  def home
    @offices = Office.all
    @machines = Machine.all
    @customers = Customer.all
  end

  def registration; end

  def registration_post
    user = User.new(
      office: Office.first,
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )

    user.save!
  end

  def login; end

  def login_confirmation
    authenticate(email: params[:email], password: params[:password])
    redirect_to root_path
  end

  def current_user
    @current_user ||= check_authenticate
  end

  def current_office
    @current_office ||= current_user.office
  end
end
