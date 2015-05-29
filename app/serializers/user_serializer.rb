class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :access, :created_at, :updated_at
end