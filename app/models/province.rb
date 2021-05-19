# frozen_string_literal: true

# Province
class Province < ApplicationRecord
  has_many :cities
end
