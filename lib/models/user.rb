class User
  include Mongoid::Document
  field :euros_spent, type: Float, default: 0
end
