require "test_helper"

class AdobeAirTest < Minitest::Test
  setup do
    @browser = Browser.new
  end

  test "detects adobe air" do
    @browser.ua = $ua["ADOBE_AIR"]

    assert @browser.webkit?
    assert_equal "533", @browser.version
    assert_equal "533.19.4", @browser.full_version
    assert_equal "Other", @browser.name
  end
end
