require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'
require './lib/reunion'
class ReunionTest < Minitest::Test
  def setup
    @reunion = Reunion.new("1406 BE")
    @brunch = Activity.new("Brunch")
  end

  def test_it_exists
    assert_instance_of Reunion, @reunion
  end

  def test_it_has_a_name
    assert_equal "1406 BE", @reunion.name
  end

  def test_it_starts_with_no_activities
    assert_equal [], @reunion.activities
  end

  def test_it_can_add_activities
    @reunion.add_activity(@brunch)

    assert_equal [@brunch], @reunion.activities
  end
end
