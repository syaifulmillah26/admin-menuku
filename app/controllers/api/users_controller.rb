# frozen_string_literal: true

module Api
  # user controller
  class UsersController < Api::ResourceController
    exception = %i[create email_confirmation forgot_password set_new_password]
    before_action :authenticate_user, except: exception
    before_action :authenticate_admin, except: exception

    # activating user
    def email_confirmation
      status, result = Officer::Account::EmailConfirmation.new(
        params
      ).activate

      render json: result, status: status
    rescue StandardError => e
      render json: { message: e.message }, status: 500
    end

    # handle forgot password
    def forgot_password
      status, result = Officer::Account::Password.new(
        params
      ).reset_password

      render json: result, status: status
    rescue StandardError => e
      render json: { message: e.message }, status: 500
    end

    # handle set new password
    def set_new_password
      status, result = Officer::Account::Password.new(
        params
      ).new_password

      render json: result, status: status
    rescue StandardError => e
      render json: { message: e.message }, status: 500
    end
  end
end
