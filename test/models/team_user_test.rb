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

  test "scope owner" do
    nate = users(:nate)
    britt = users(:brittany)
    team = teams(:avengers)

    TeamUser.new(user_id: nate.id, team_id: team.id, role: 'member').save
    TeamUser.new(user_id: britt.id, team_id: team.id, role: 'owner').save

    owners = team.users.merge(TeamUser.owner)
    assert_equal 1, owners.count, "Team owner count was not as expected"
    assert_equal 'bmarley', owners.first.login, "Team owner was not expected user"
  end

  test "scope member" do
    nate = users(:nate)
    britt = users(:brittany)
    team = teams(:avengers)

    TeamUser.new(user_id: nate.id, team_id: team.id, role: 'member').save
    TeamUser.new(user_id: britt.id, team_id: team.id, role: 'owner').save

    members = team.users.merge(TeamUser.member)
    assert_equal 1, members.count, "Team member count was not as expected"
    assert_equal 'nmarley', members.first.login, "Team member was not expected user"
  end
end
