class Status
  attr_accessor :name, :ride_threshold

  @@statuses = []

  def initialize(name, ride_threshold)
    @name = name
    @ride_threshold = ride_threshold

    self.class.add_status(self)
  end

  def self.status_name(status_index)
    @@statuses[status_index].name
  end

  def self.status_threshold(status_index)
    @@statuses[status_index].ride_threshold
  end

  def self.add_status(status)
    @@statuses << status
  end
end
