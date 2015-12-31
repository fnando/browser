require "test_helper"

class ConsoleTest < Minitest::Test
  setup do
    @browser = Browser.new
  end

  test "detects psp" do
    @browser.ua = $ua["PSP"]
    assert_equal "Other", @browser.name
  end

  test "detects psp vita" do
    @browser.ua = $ua["PSP_VITA"]
    assert_equal "Other", @browser.name
  end
end
