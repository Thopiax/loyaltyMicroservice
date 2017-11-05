class User
  include Mongoid::Document
  field :euros_spent, type: Float, default: 0

  def points
    self.euros_spent.to_i
  end
end
