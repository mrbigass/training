# frozen_string_literal: true

class RentalReservationForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Validations

  attribute :office, klass: :office
  attribute :customer_id
  attribute :machine_id
  attribute :from, :datetime, default: -> { Time.now }
  attribute :to, :datetime, default: -> { Time.now + 2.weeks }

  validates :office, presence: true
  validates :machine_id, presence: true
  validates :customer_id, presence: true

  def save
    return false unless valid?

    lending = Lending.new(
      office: office,
      customer_id: customer_id,
      machine_id: machine_id,
      from: from,
      to: to
    )
    lending.save
  end
end
