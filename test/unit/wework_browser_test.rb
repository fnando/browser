# frozen_string_literal: true

require "test_helper"

class WeworkBrowserTest < Minitest::Test
  test "detects Wework Browser" do
    browser = Browser.new(Browser["WEWORK_BROWSER"])
    assert browser.wework_browser?
    refute browser.safari?
    refute browser.chrome?
    assert_equal "Wework Browser", browser.name
    assert_equal :wework_browser, browser.id
  end

  test "detects correct version" do
    browser = Browser.new(Browser["WEWORK_BROWSER"])
    assert_equal "10.1.2.300", browser.full_version
    assert_equal "10", browser.version
  end

  test "detects version by range" do
    browser = Browser.new(Browser["WEWORK_BROWSER"])
    assert browser.huawei_browser?(%w[>=10 <11])
  end
end
