require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  test "should not save team without email" do
    team = Team.new(login: 'avengers')
    assert_not team.save, "Saved the team without an email"
  end

  test "should not save team without login" do
    team = Team.new(email: 'avengers@marvel.example.com')
    assert_not team.save, "Saved the team without a login"
  end
end
