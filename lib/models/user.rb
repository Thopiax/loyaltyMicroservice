class User
  include Mongoid::Document

  field :euros_spent, type: Float, default: 0
  field :status, type: String, default: "bronze"

  def points
    self.euros_spent.to_i
  end

  def add_points(euros_spent)
    self.euros_spent += euros_spent
    self.save!
  end

  def self.find_or_404(user_id)
    user = User.find(user_id)
    yield(user)
  rescue Mongoid::Errors::DocumentNotFound
    404
  end
end
