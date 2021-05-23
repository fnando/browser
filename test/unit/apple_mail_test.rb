# frozen_string_literal: true

require "test_helper"

class AppleMailTest < Minitest::Test
  test "detect Apple Mail" do
    browser = Browser.new(Browser["APPLE_MAIL"])
    assert browser.platform.mac?
    assert_equal "Apple Mail", browser.name
    assert browser.apple_mail?
    refute browser.safari?
    assert_equal "0.0", browser.full_version
    assert_equal "0", browser.version
  end
end
