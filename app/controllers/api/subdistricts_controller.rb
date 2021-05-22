# frozen_string_literal: true

module Api
  # subdistrict controller
  class SubdistrictsController < Api::ResourceController
    before_action :authenticate_user, except: %i[index]
    def index
      status, result = Officer::States::Subdistrict.new(
        params
      ).perform

      return render json: result, status: 500 unless status

      render json: result, status: :ok
    rescue StandardError => e
      render json: { message: e.message }, status: 422
    end
  end
end
