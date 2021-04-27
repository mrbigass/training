# frozen_string_literal: true

class LendingsController < ApplicationController
  def new; end

  def create
    rental_reservation_form = RentalReservationForm.new(lending_params)

    redirect_to root_path if rental_reservation_form.save
  end

  def lending_params
    params.require(:rental_reservation_form).permit(
      :customer_id,
      :machine_id,
      :from,
      :to
    ).merge(
      office: current_user.office
    )
  end
end
