class User
  include Mongoid::Document

  field :points,       type: Integer, default: 0
  field :euros_spent,  type: Float,   default: 0
  field :status_index, type: Integer, default: 0
  field :ride_count,   type: Integer, default: 0

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

  def status
    Status.status_name(self.status_index)
  end

  def rides_remaining
    next_status_threshold - self.ride_count
  end

  def add_points(euros_spent, is_ride)
    self.euros_spent += euros_spent
    self.add_ride if is_ride == "true"
    # only calculate points at the end in case status changes
    self.points += euros_spent * euro_to_point_rate
  end

  private

  def add_ride
    self.ride_count += 1
    check_status
  end

  def next_status_threshold
    # returns infinity if the next status doesn't exist (i.e. highest possible level)
    Status.status_threshold(self.status_index + 1) || Float::INFINITY
  end

  def euro_to_point_rate
    Status.status_rate(self.status_index)
  end

  def check_status
    # update status if the ride count passed the next_status_threshold
    self.status_index += 1 if self.ride_count > next_status_threshold
  end
end
