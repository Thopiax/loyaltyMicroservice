require 'concurrency'
require 'sinatra'

class NoSuchCurrencyCodeError < StandardError; end

class User
  include Mongoid::Document

  field :points,       type: Integer, default: 0
  field :money_spent,  type: Float,   default: 0
  field :status_index, type: Integer, default: 0
  field :ride_count,   type: Integer, default: 0

  def self.find_or_404(user_id)
    user = User.find(user_id)
    yield(user)
  rescue Mongoid::Errors::DocumentNotFound
    404
  end

  def self.valid_user_points(money_spent, is_ride)
    # check if money_spent is a positive float
    # and check if is_ride is a boolean
    money_spent.present? && money_spent.to_f.to_s == money_spent &&
      money_spent.to_f > 0 && (is_ride == "false" || is_ride == "true")
  end

  def status
    Status.status_name(self.status_index)
  end

  def rides_remaining
    next_status_threshold - self.ride_count
  end

  def add_points(money_spent, is_ride, foreign_currency_code = nil)
    euros_spent = if foreign_currency_code.nil?
      money_spent
    else
      convert(money_spent, foreign_currency_code)
    end

    self.money_spent += euros_spent

    add_ride if is_ride == "true"
    # only calculate points at the end in case status changes
    self.points += euros_spent * euro_to_point_rate
  end

  private

  def add_ride
    self.ride_count += 1
    check_status
  end

  def convert(amount, foreign_currency_code)
    Concurrency.convert(amount, foreign_currency_code, "EUR")
  rescue NoMethodError
    raise NoSuchCurrencyCodeError
  end

  def euro_to_point_rate
    Status.status_rate(self.status_index)
  end

  def next_status_threshold
    # returns infinity if the next status doesn't exist (i.e. highest possible level)
    Status.status_threshold(self.status_index + 1) || Float::INFINITY
  end

  def check_status
    # update status if the ride count passed the next_status_threshold
    self.status_index += 1 if self.ride_count > next_status_threshold
  end
end
