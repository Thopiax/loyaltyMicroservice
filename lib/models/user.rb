class User
  include Mongoid::Document

  field :euros_spent, type: Float, default: 0

  def points
    self.euros_spent.to_i
  end

  def self.fetch_or_404(user_id)
    user = User.find(user_id)
    yield(user)
  rescue Mongoid::Errors::DocumentNotFound
    404
  end
end
