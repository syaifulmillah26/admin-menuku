# frozen_string_literal: true

# Subdistrict
class Subdistrict < ApplicationRecord
  belongs_to :province
  belongs_to :city
end
