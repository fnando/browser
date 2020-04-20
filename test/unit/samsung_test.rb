# frozen_string_literal: true

require "test_helper"

class SamsungTest < Minitest::Test
  test "detects samsung browser" do
    browser = Browser.new(Browser["SAMSUNG_BROWSER"])

    assert browser.webkit?
    assert_equal "11", browser.version
    assert_equal "11.1", browser.full_version
    assert_equal "Samsung Browser", browser.name
    assert_equal "Android", browser.platform.name
    assert_equal "10", browser.platform.version
  end
end
