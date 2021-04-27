# frozen_string_literal: true

class RentalReservationForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Validations

  attribute :office, klass: :office
  attribute :customer_id, :integer
  attribute :machine_id, :integer
  attribute :from, :datetime, default: -> { Time.now }
  attribute :to, :datetime, default: -> { Time.now + 2.weeks }

  validates :office, presence: true
  validates :machine_id, presence: true
  validates :customer_id, presence: true

  def save
    return false unless valid?

    customer = Customer.find_by(id: customer_id)
    machine = Machine.find_by(id: machine_id)

    lending = Lending.new(
      office: office,
      customer: customer,
      machine: machine,
      from: from,
      to: to
    )
    lending.save
  end
end
