# frozen_string_literal: true
require "test_helper"

class MacTest < Minitest::Test
  test "detects mac" do
    browser = Browser.new(Browser["CHROME"])

    assert browser.platform.mac?
    assert_equal "Macintosh", browser.platform.name
    assert_equal "10.6.4", browser.platform.version
  end
end
