# frozen_string_literal: true

module Officer
  module Companies
    # Main
    class Main < Api::ApplicationController
      attr_reader :params

      def initialize(params)
        @params = params
        @current_user = params[:current_user]
      end

      def index
        return [200, results(Company.all)] if @current_user.is_admin?

        [200, result(@current_user.company)]
      end

      def update
        return root_not_found if company.blank?

        company.update(company_params)
        [200, result(company)]
      end

      private

      def company
        ::Company.find_by(id: params[:id], user_id: @current_user.id)
      end

      def company_params
        params[:company].permit(permitted_params)
      end

      def permitted_params
        ::Officer::PermittedAttributes.company_attributes
      end
    end
  end
end
