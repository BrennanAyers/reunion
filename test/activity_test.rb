require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'
class ActivityTest < Minitest::Test
  def setup
    @activity = Activity.new("Brunch")
  end

  def test_it_exists
    assert_instance_of Activity, @activity
  end

  def test_it_has_a_name_and_no_participants
    assert_equal "Brunch", @activity.name
    expected = {}
    assert_equal expected, @activity.participants
  end

  def test_it_can_add_participants
    @activity.add_participant("Maria", 20)
    expected = {"Maria" => 20}
    assert_equal expected, @activity.participants

    @activity.add_participant("Luther", 40)
    expected = {"Maria" => 20, "Luther" => 40}
    assert_equal expected, @activity.participants
  end

  def test_it_keeps_track_of_cost
    @activity.add_participant("Maria", 20)
    assert_equal 20, @activity.total_cost

    @activity.add_participant("Luther", 40)
    assert_equal 60, @activity.total_cost
  end

  def test_it_returns_a_split_cost
    @activity.add_participant("Maria", 20)
    @activity.add_participant("Luther", 40)

    assert_equal 30, @activity.split
  end

  def test_it_correctly_tracks_amount_owed
    @activity.add_participant("Maria", 20)
    @activity.add_participant("Luther", 40)

    expected = {
      "Maria" => 10,
      "Luther" => -10
    }

    assert_equal expected, @activity.owed
  end
end
