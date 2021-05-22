# frozen_string_literal: true

module Api
  # cities api
  class CitiesController < Api::ResourceController
    skip_before_action :authenticate_user
    def index
      status, result = Officer::States::City.new(
        params
      ).perform

      return render json: result, status: 422 unless status

      render json: result, status: :ok
    rescue StandardError => e
      render json: { message: e.message }, status: 422
    end
  end
end
