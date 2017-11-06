require_relative './test/test_helper'

class StatusTestCase < Test::Unit::TestCase

  def test_creating_new_status_adds_it_to_list
    Status.new("test", 100, 42)
    assert_equal Status.status_name(-1), "test"
  end

  def test_threshold_for_undefined_status_doesnt_fail
    assert_nil Status.status_threshold(42)
  end

  def test_name_for_undefined_status_fails
    assert_raise NoMethodError do
      Status.status_name(42)
    end
  end

  def test_rate_for_undefined_status_fails
    assert_raise NoMethodError do
      Status.status_rate(42)
    end
  end

end
