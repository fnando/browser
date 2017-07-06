# frozen_string_literal: true

require "test_helper"

class OtterBrowserTest < Minitest::Test
  test "detects Otter Browser" do
    browser = Browser.new(Browser["OTTER_BROWSER"])
    assert browser.otter_browser?
    assert_equal "Otter", browser.name
  end
end
