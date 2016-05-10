# frozen_string_literal: true
require "test_helper"

class MicroMessengerTest < Minitest::Test
  test "detects weibo iOS" do
    browser = Browser.new(Browser["WEIBO_IOS"])

    assert_equal :weibo, browser.id
    assert browser.weibo?
    assert_equal "Weibo", browser.name
    assert_equal "5.7.1", browser.full_version
  end

  test "detects weibo Android" do
    browser = Browser.new(Browser["WEIBO_ANDROID"])

    assert_equal :weibo, browser.id
    assert browser.weibo?
    assert_equal "Weibo", browser.name
    assert_equal "5.7.1", browser.full_version
  end
end
