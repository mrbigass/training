# frozen_string_literal: true

class RentalReservationForm
  include ActiveModel::Model
  validates :office_id, presence: true
  validates :machine_id, presence: true
end
