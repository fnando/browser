require "test_helper"

class UcBrowserTest < Minitest::Test
  setup do
    @browser = Browser.new(ua: $ua["UC_BROWSER"])
  end

  test "detects UC Browser" do
    assert @browser.mobile?
    assert @browser.uc_browser?
    assert_equal @browser.name, "UC Browser"
  end
end
