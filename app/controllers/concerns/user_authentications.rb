# frozen_string_literal: true

module UserAuthentications
  extend ActiveSupport::Concern

  def authenticate(email:, password:)
    return unless email && password

    user = User.find_by(email: email)
    session[:user_id] = user.id if user&.authenticate(password)
  end

  def check_authentication
    if session[:user_id] && User.find(session[:user_id])
      User.find(session[:user_id])
    else
      redirect_to login_path
    end
  end
end
