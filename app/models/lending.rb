# frozen_string_literal: true

class Lending < ApplicationRecord
  belongs_to :office
  belongs_to :machine
  belongs_to :customer

  attribute :from, :datetime, default: -> { Time.now }
  attribute :to, :datetime, default: -> { Time.now + 2.weeks }

  validates :office, presence: true
  validates :machine, presence: true
  validates :customer, presence: true
  validate :not_return_before_lend

  def not_return_before_lend
    errors.add(:validate, '返却を貸し出し前に設定できません') if to < from
  end
end
