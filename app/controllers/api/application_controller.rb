# frozen_string_literal: true

module Api
  # ApplicationController
  class ApplicationController < ActionController::API
    include Knock::Authenticable
    include ApplicationHelper
    before_action :authenticate_user
    undef_method :current_user

    def admin_permission
      current_user.has_role?(:admin)
    end

    def serializer(object)
      ActiveModel::SerializableResource.new(object).as_json
    end

    def invalid_resource!(resource)
      Rails.logger.error "resouce_errors => #{resource.errors.full_messages}"
      render json: { error: resource.errors.full_messages }, status: :unprocessable_entity
    end

    def t(data)
      I18n.t(data)
    end
  end
end
