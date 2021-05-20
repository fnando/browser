# frozen_string_literal: true

require "test_helper"

class YahooMobileAppTest < Minitest::Test
  test "detects yahoo_app" do
    browser = Browser.new(Browser["YAHOO_MOBILE_APP"])

    assert browser.webkit?
    assert browser.yahoo_app?
    assert_equal "4", browser.version
    assert_equal :yahoo_app, browser.id
    assert_equal "4.38.0", browser.full_version
    assert_equal "Yahoo Mobile App", browser.name
    refute browser.chrome?
    refute browser.safari?
  end

  test "detects version by range" do
    browser = Browser.new(Browser["YAHOO_MOBILE_APP"])
    assert browser.samsung_browser?(%w[>=4 <5])
  end
end
