# frozen_string_literal: true

# User
class Menuku
  # class company from Menuku db
  class User < Menuku

    devise  :database_authenticatable, :registerable,
            :recoverable, :rememberable, :validatable, :timeoutable,
            :trackable and :omniauthable

    belongs_to  :company,
                class_name: 'Company',
                optional: true

    belongs_to  :outlet,
                class_name: 'Outlet',
                optional: true

    after_create :set_default_role
    after_create :set_company_id

    private

    def set_default_role
      Menuku::UsersRole.create!(user_id: id, role_id: 1)
    end

    def set_company_id
      update_column(:company_id, outlet.company.id)
    end
  end
end
