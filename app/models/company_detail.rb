# frozen_string_literal: true

# CompanyDetail
class CompanyDetail < ApplicationRecord
  belongs_to  :company,
              class_name: 'Company',
              touch: true,
              optional: true

  belongs_to  :address,
              class_name: 'Address',
              dependent: :destroy

  accepts_nested_attributes_for :address, update_only: true, allow_destroy: true
end
