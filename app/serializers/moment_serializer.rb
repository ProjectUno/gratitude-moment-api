class MomentSerializer < ActiveModel::Serializer
  attributes :id, :phone, :body, :twilio_id
  has_one :user
end
