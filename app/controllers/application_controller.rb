# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :check_authenticate, only: %i[home]

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
    user = User.find_by(email: params[:email])
    return unless user&.authenticate(params[:password])

    session[:user_id] = user.id
    redirect_to root_path
  end

  private

  def check_authenticate
    if User.find_by(id: session[:user_id])
      true
    else
      redirect_to login_path
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def current_office
    @current_office ||= current_user.office
  end
end
