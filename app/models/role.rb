# role
class Role < ApplicationRecord
  has_and_belongs_to_many :users, join_table: :users_roles

  belongs_to :resource,
             polymorphic: true,
             optional: true

  validates :resource_type,
            inclusion: { in: Rolify.resource_types },
            allow_nil: true

  scopify

  before_destroy :check_if_can_be_destroyed

  def check_if_can_be_destroyed
    return if name != 'admin'

    raise 'Admin could not be destroyed'
  end
end
