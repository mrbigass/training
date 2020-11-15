# frozen_string_literal: true

class MachinesController < ApplicationController
  def new; end

  def create
    machine = Machine.new(machine_params)
    machine.save!
    redirect_to root_path
  end

  private

  def machine_params
    params.require(:machine).permit(
      :name
    ).merge(office_id: current_office.id)
  end
end
