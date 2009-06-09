require File.dirname(__FILE__) + '/../test_helper.rb'

module ConditionTests
  class AnyTextFieldMatchesTest < ActiveSupport::TestCase
    def test_sanitize
      condition = Searchlogic::Condition::AnyTextFieldMatches.new(User)
      condition.value = 'tot'
      assert_equal ["\"users\".\"first_name\" LIKE ? OR \"users\".\"last_name\" LIKE ? OR \"users\".\"bio\" LIKE ?", "%tot%", "%tot%", "%tot%"], condition.sanitize
    end
  end
end