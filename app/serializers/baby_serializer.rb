# frozen_string_literal: true

class BabySerializer < ActiveModel::Serializer
  attributes :name, :mother_name, :father_name, :address, :phone
  attribute :age do
    today = Time.zone.today
    (today.year * 12 + today.month) - (object.birthday.year * 12 + object.birthday.month)
  end
end
