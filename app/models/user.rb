# frozen_string_literal: true

# User
class User < ApplicationRecord
  include StateMachines::User
  include ApplicationHelper
  include MailHelper

  # acts_as_paranoid

  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, :timeoutable,
          :trackable and :omniauthable
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  alias_method :authenticate, :valid_password?
  rolify

  has_one   :user_detail,
            class_name: 'UserDetail',
            dependent: :destroy,
            inverse_of: :user

  has_one   :company,
            class_name: 'Company',
            dependent: :destroy,
            inverse_of: :user

  after_create :send_email_confirmation
  after_create :assign_default_role
  after_create :set_company

  accepts_nested_attributes_for :user_detail,
                                update_only: true,
                                allow_destroy: true

  private

  def send_email_confirmation
    return confirm! unless roles.blank?

    update_column(:confirmation_token, secure_random_token)
    update_column(:confirmation_sent_at, current_time)
    send_mail_confirmation_instructions(self)
  end

  def assign_default_role
    add_role(:user) if roles.blank?
  end

  def update_confirmed_at
    update_column(:confirmed_at, current_time)
  end

  def set_company
    Company.create!(user_id: id) if is_user?
  end
end
