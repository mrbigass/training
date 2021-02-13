# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  belongs_to :office
end
