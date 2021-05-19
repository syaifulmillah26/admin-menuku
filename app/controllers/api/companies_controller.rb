# frozen_string_literal: true

module Api
  # province controller
  class CompaniesController < Api::ResourceController
    before_action :authenticate_user, except: %i[create]
  end
end
