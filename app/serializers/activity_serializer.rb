# frozen_string_literal: true

class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :name, :description
end
