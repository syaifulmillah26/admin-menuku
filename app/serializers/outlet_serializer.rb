class OutletSerializer < ActiveModel::Serializer
  attributes  :id, :name, :company_id, :status, :address,
              :employees

  def employees
    object.employees
  end
end
