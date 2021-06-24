class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :status
  has_one :user_detail
end
