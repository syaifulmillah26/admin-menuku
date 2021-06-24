# frozen_string_literal: true

module Officer
  module Account
    # Profile confirmation
    class Profile < ::Api::ApplicationController
      include UserHelper
      attr_reader :params

      def initialize(params)
        @params = params
        @current_user = params[:current_user]
      end

      def update
        @current_user.update(user_params)
        [200, result]
      end

      private

      def result
        {
          message: t('officer.account.success'),
          data: serializer(@current_user)
        }
      end

      def user_params
        params[:user].permit(permitted_params)
      end

      def permitted_params
        ::Officer::PermittedAttributes.user_attributes
      end
    end
  end
end
