# frozen_string_literal: true

# City
class City < ApplicationRecord
  belongs_to :province
  has_many :subdistrict
end
