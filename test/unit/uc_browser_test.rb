require "test_helper"

class UcBrowserTest < Minitest::Test
  test "detects UC Browser" do
    browser = Browser.new(ua: $ua["UC_BROWSER"])
    assert browser.uc_browser?
    assert_equal browser.name, "UC Browser"
  end
end
