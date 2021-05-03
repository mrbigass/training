# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include UserAuthentications
  # TODO: CSRF対策のトークン検証をスキップしているので落ち着いたら戻す
  skip_before_action :verify_authenticity_token
end
