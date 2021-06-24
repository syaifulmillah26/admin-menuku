# frozen_string_literal: true

module Api
  # province controller
  class CompaniesController < Api::ResourceController
    before_action :authenticate_admin, only: %i[create destroy]
    before_action :set_user_params

    def index
      status, result = Officer::Companies::Main.new(
        params
      ).index

      render json: result, status: status
    rescue StandardError => e
      render json: { message: e.message }, status: 500
    end

    def update
      status, result = Officer::Companies::Main.new(
        params
      ).update

      render json: result, status: status
    rescue StandardError => e
      render json: { message: e.message }, status: 500
    end
  end
end
