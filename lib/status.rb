class Status
  attr_accessor :name, :ride_threshold, :euro_to_point_rate

  @@statuses = []

  def initialize(name, ride_threshold, euro_to_point_rate)
    @name = name
    @ride_threshold = ride_threshold
    @euro_to_point_rate = euro_to_point_rate

    self.class.add_status(self)
  end

  def self.status_name(status_index)
    self.status(status_index).name
  end

  def self.status_threshold(status_index)
    self.status(status_index).ride_threshold
  end

  def self.status_rate(status_index)
    self.status(status_index).euro_to_point_rate
  end

  def self.status(status_index)
    # return the highest status in the hierarchy (last in list) if index out of bounds
    return @@statuses[status_index] if status_index >= @@statuses.size
    @@statuses[status_index]
  end

  private

  def self.add_status(status)
    @@statuses << status
  end
end
