# frozen_string_literal: true

require "test_helper"

class KindleTest < Minitest::Test
  test "detects kindle monochrome" do
    browser = Browser.new(Browser["KINDLE"])
    assert browser.webkit?
  end

  test "detects kindle fire" do
    browser = Browser.new(Browser["KINDLE_FIRE"])
    assert browser.webkit?

    browser = Browser.new(Browser["KINDLE_SILK_TABLET"])
    assert browser.webkit?

    browser = Browser.new(Browser["KINDLE_SILK_DESKTOP"])
    assert browser.webkit?

    browser = Browser.new(Browser["KINDLE_SILK_MOBILE"])
    assert browser.webkit?

    browser = Browser.new(Browser["KINDLE_SILK_TABLET_1ST_GEN"])
    assert browser.webkit?

    browser = Browser.new(Browser["KINDLE_SILK_MOBILE_1ST_GEN"])
    assert browser.webkit?
  end

  test "detects kindle fire hd" do
    browser = Browser.new(Browser["KINDLE_FIRE_HD"])

    assert browser.webkit?
  end

  test "detects kindle fire hd mobile" do
    browser = Browser.new(Browser["KINDLE_FIRE_HD_MOBILE"])

    assert browser.webkit?
  end
end
