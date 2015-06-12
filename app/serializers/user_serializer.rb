class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :access, :last_active, :login_count, :created_at, :updated_at
end