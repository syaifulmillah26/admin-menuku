# frozen_string_literal: true

module Api
  # subdistrict controller
  class SubdistrictsController < Api::ResourceController
    before_action :authenticate_user, except: %i[index]
    def index
      @objects = model_class.all
      @all = total
      if params[:city_id].present?
        @objects = model_class.where(city_id: params[:city_id])
      end
      render json: all_datas, status: :ok
    rescue StandardError => e
      render json: { message: e.message }, status: 422
    end
  end
end
