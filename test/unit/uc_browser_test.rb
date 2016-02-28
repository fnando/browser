# frozen_string_literal: true
require "test_helper"

class UcBrowserTest < Minitest::Test
  test "detects UC Browser" do
    browser = Browser.new(Browser["UC_BROWSER"])
    assert browser.uc_browser?
    assert_equal browser.name, "UCBrowser"
  end
end
