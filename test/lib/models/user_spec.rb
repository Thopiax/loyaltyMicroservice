require_relative '../../spec_helper'
require_relative '../../api/base_api_spec'

class UserSpec < Test::Unit::TestCase

  def test_find_or_404_works_with_invalid_user
    User.find_or_404("invalid_user") do |result|
      assert_equal user, 404
    end
  end

  def test_find_or_404_works_with_valid_user
    user = create_user(id: "find_or_404_works_with_valid_user")
    User.find_or_404("find_or_404_works_with_valid_user") do |result|
      assert_equal user, result
    end
  end

  def test_valid_user_points_with_valid_params_works
    assert User.valid_user_points("5.0", "true")
    assert User.valid_user_points("1.0", "false")
  end

  def test_valid_user_points_with_invalid_params_fails
    assert !User.valid_user_points("string", "true")
    assert !User.valid_user_points("-1.0", "false")
    assert !User.valid_user_points("1.0", false)
    assert !User.valid_user_points("1.0", "blah")
    assert !User.valid_user_points(1.0, "blah")
  end

  def test_add_points_works_with_ride
    user = create_user(id: 'add_points_with_ride_user')

    user.add_points(42, "true")
    user.save!

    assert_equal 42, user.points
    assert_equal 1, user.ride_count
  end

  def test_add_points_works_without_ride
    user = create_user(id: 'add_points_without_ride_user')

    user.add_points(34, "false")
    user.save!

    assert_equal 34, user.points
    assert_equal 0, user.ride_count
  end

  def test_add_points_works_with_higher_status
    user = create_user(id: 'add_points_with_higher_status_user', status_index: 2)
    p user.status
    user.add_points(5, "false")
    user.save!

    assert_equal 25, user.points
    assert_equal 0, user.ride_count
  end
end
