# frozen_string_literal: true

# User
class User < ApplicationRecord
  include StateMachines::User
  include UuidHelper

  acts_as_paranoid

  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, :timeoutable,
          :trackable and :omniauthable
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  alias_method :authenticate, :valid_password?
  extend FriendlyId
  friendly_id :uuid, use: :slugged
  rolify

  has_one :user_detail, class_name: 'UserDetail', dependent: :destroy, inverse_of: :user
  has_one :address, through: :user_detail

  after_create :send_email_confirmation
  after_create :assign_default_role

  accepts_nested_attributes_for :user_detail

  private

  def check_uuid
    User.where(uuid: @uuid)
  end

  def send_email_confirmation
    return user.confirm! unless user.roles.blank?

    update_column(:confirmation_token, SecureRandom.hex(50))
    update_column(:confirmation_sent_at, DateTime.now)
    DeviseMailer.with(object: user).confirmation_instructions.deliver_later
  end

  def assign_default_role
    user.add_role(:user) if user.roles.blank?
  end

  def user
    self
  end

  def update_confirmed_at
    update_column(:confirmed_at, DateTime.now)
  end
end
