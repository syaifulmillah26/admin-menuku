# frozen_string_literal: true

# Company
class Company < ApplicationRecord
  include StateMachines::Company

  belongs_to :user

  has_one :company_detail, dependent: :destroy

  has_many :outlets, dependent: :destroy

  accepts_nested_attributes_for :company_detail,
                                update_only: true,
                                allow_destroy: true
end
