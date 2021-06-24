# frozen_string_literal: true

# Outlet
class Outlet < ApplicationRecord
  include StateMachines::Outlet
  belongs_to  :company

  belongs_to  :address,
              class_name: 'Address',
              dependent: :destroy

  has_many    :employees,
              class_name: 'Menuku::User',
              dependent: :destroy

  accepts_nested_attributes_for :address,
                                update_only: true,
                                allow_destroy: true

  accepts_nested_attributes_for :employees,
                                allow_destroy: true
end
