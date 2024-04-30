# frozen_string_literal: true

require "test_helper"

class MetaTest < Minitest::Test
  class CustomRule < Browser::Meta::Base
    def meta
      "custom" if browser.ua.include?("Custom")
    end
  end

  test "extends rules" do
    Browser::Meta.rules.unshift(CustomRule)

    browser = Browser.new("Custom")
    assert_includes browser.meta, "custom"

    browser = Browser.new("Safari")
    refute_includes browser.meta, "custom"

    Browser::Meta.rules.shift

    browser = Browser.new("Custom")
    refute_includes browser.meta, "custom"
  end

  test "sets meta" do
    browser = Browser.new(Browser["CHROME"])
    assert_kind_of Array, browser.meta
  end

  test "returns string representation" do
    browser = Browser.new(Browser["CHROME"])
    meta = browser.to_s

    assert_includes meta, "chrome"
    assert_includes meta, "webkit"
    assert_includes meta, "mac"
  end

  test "returns string representation for mobile" do
    browser = Browser.new(Browser["BLACKBERRY"])
    meta = browser.to_s

    assert_includes meta, "blackberry"
    assert_includes meta, "mobile"
  end

  test "returns string representation for unknown platform/device/browser" do
    browser = Browser.new("Unknown")
    meta = browser.to_s

    assert_includes meta, "unknown_platform"
    assert_includes meta, "unknown_device"
    assert_includes meta, "unknown_browser"
  end
end
