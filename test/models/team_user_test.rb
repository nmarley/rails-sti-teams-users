require 'test_helper'
# require 'byebug'
# require 'pp'

class TeamUserTest < ActiveSupport::TestCase
  test "should not save a team_user without a role" do
    user = users(:nate)
    team = teams(:avengers)

    tu = TeamUser.new(user_id: user.id, team_id: team.id)
    assert_not tu.save, "Saved the team_user link without a team role specified"
  end

  test "should not save a team_user with an invalid role" do
    user = users(:nate)
    team = teams(:avengers)

    tu = TeamUser.new(user_id: user.id, team_id: team.id)
    tu.role = 'emperor_for_life'
    assert_not tu.save, "Saved the team_user with an invalid role"
  end

  test "should save a team_user with a valid role" do
    user = users(:nate)
    team = teams(:avengers)

    tu = TeamUser.new(user_id: user.id, team_id: team.id)
    tu.role = 'owner'
    assert tu.save, "Could not save the team_user with a valid role"
  end
end
