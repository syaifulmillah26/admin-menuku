# frozen_string_literal: true

module Api
  # cities api
  class CitiesController < Api::ResourceController
    before_action :authenticate_user, except: %i[index]
    def index
      @objects = model_class.all
      @all = total
      if params[:province_id].present?
        @objects = model_class.where(province_id: params[:province_id])
      end
      render json: all_datas, status: :ok
    rescue StandardError => e
      render json: { message: e.message }, status: 422
    end
  end
end
