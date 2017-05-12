class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone, :password_digest
end
