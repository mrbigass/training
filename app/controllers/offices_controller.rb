# frozen_string_literal: true

class OfficesController < ApplicationController
  def new; end

  def create
    office = Office.new(office_params)
    office.save!
    redirect_to root_path
  end

  private

  def office_params
    params.require(:office).permit(
      :name
    )
  end
end
