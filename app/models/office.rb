# frozen_string_literal: true

class Office < ApplicationRecord
  has_many :users
  has_many :machines
end
