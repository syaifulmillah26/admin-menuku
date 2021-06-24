# frozen_string_literal: true

# Menuku Database
class Menuku < ActiveRecord::Base
  self.abstract_class = true
  establish_connection(Rails.env.test? ? :menuku_test : :menuku)
end
