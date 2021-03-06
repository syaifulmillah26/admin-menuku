# frozen_string_literal: true

module Api
  # BusinessTypes
  class BusinessTypesController < Api::ResourceController
    before_action :authenticate_user, except: %i[index]
    before_action :authenticate_admin, except: %i[index]
  end
end
