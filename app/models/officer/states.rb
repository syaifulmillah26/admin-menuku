# frozen_string_literal: true

module Officer
  # Main
  class States < ::Api::ApplicationController
    attr_reader :params

    def initialize(params)
      @params = params
    end

    # Main
    class City < States
      def perform
        return false, { message: t('officer.invalid_params') } \
          unless check_params

        begin
          [true, cities]
        rescue StandardError => e
          return false, e.message
        end
      end

      def cities
        ::City.where(province_id: params[:province_id])
      end

      def check_params
        return false if \
          params[:province_id].blank?

        true
      end
    end

    # Main
    class Subdistrict < States
      def perform
        return false, { message: t('officer.invalid_params') } \
          unless check_params

        begin
          [true, subdistricts]
        rescue StandardError => e
          return false, e.message
        end
      end

      def subdistricts
        ::Subdistrict.where(city_id: params[:city_id])
      end

      def check_params
        return false if \
          params[:city_id].blank?

        true
      end
    end
  end
end
