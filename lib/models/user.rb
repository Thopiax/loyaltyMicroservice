class User
  include Mongoid::Document

  field :euros_spent, type: Float, default: 0
  field :status, type: String, default: "bronze"
  field :ride_count, type: Integer, default: 0

  def points
    self.euros_spent.to_i
  end

  def rides_remaining
    self.ride_count
  end

  def add_points(euros_spent, is_ride)
    self.euros_spent += euros_spent
    self.add_ride if is_ride == "true"
  end

  def self.find_or_404(user_id)
    user = User.find(user_id)
    yield(user)
  rescue Mongoid::Errors::DocumentNotFound
    404
  end

  def self.valid_user_points(euros_spent, is_ride)
    euros_spent.present? && euros_spent.to_f > 0 && # check if euros_spent is a positive float
       is_ride == "false" || is_ride == "true"      # check if is_ride is a boolean
  end

  def add_ride
    self.ride_count += 1
    self.status = loyalty_status
  end

  def loyalty_status
    return "bronze" if self.ride_count < 10
    return "silver" if self.ride_count < 25
    return "gold"   if self.ride_count < 50
    return "platinum"
  end
end
