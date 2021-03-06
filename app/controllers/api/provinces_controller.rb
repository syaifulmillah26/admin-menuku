# frozen_string_literal: true

module Api
  # province controller
  class ProvincesController < Api::ResourceController
    before_action :authenticate_user, except: %i[index]
  end
end
