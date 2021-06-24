# frozen_string_literal: true

module Api
  # province controller
  class OutletsController < Api::ResourceController
    before_action :set_user_params
    before_action :validate_company, only: %i[show update destroy]
    before_action :set_company_id, only: :create

    def index
      status, result = Officer::Outlets::Main.new(
        params
      ).grab_all

      render json: result, status: status
    rescue StandardError => e
      render json: { error: e.message }, status: 500
    end

    private

    def validate_company
      return if @object.company_id == current_user.company.id

      root_not_found
    end

    def set_company_id
      return if params[:outlet][:company_id].present?

      params[:outlet][:company_id] = current_user.company.id
    end
  end
end
