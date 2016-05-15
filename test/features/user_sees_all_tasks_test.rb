require_relative "../test_helper"

class UserSeesAllTasksTest < FeatureTest
  def test_user_sees_all_tasks
    visit "/robots"
    assert page.has_content?("All Robots")
  end
end
