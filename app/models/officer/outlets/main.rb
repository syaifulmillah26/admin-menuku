# frozen_string_literal: true

module Officer
  module Outlets
    # Main
    class Main < Api::ApplicationController
      attr_reader :params

      def initialize(params)
        @params = params
        @current_user = params[:current_user]
      end

      def grab_all
        return [200, results(Outlet.all)] if @current_user.is_admin?

        [200, results(@current_user.company.outlets)]
      end
    end
  end
end
