# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :auth_token
  attribute :expires_at do
    object.expires_at.strftime('%Y-%m-%dT%H:%M:%S.%L%z')
  end
end
