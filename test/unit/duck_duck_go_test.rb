# frozen_string_literal: true

require "test_helper"

class DuckDuckGoTest < Minitest::Test
  test "detects DuckDuckGo on iOS device" do
    browser = Browser.new(Browser["DUCKDUCKGO_BROWSER_IOS"])

    assert browser.duck_duck_go?
    refute_predicate browser, :safari?
    refute_predicate browser, :chrome?
    assert browser.webkit?
    refute_predicate browser, :bot?
    assert_equal "DuckDuckGo", browser.name
    assert_equal :duckduckgo, browser.id
  end

  test "detects DuckDuckGo on Android device" do
    browser = Browser.new(Browser["DUCKDUCKGO_BROWSER_ANDROID"])

    assert browser.duck_duck_go?
    refute_predicate browser, :safari?
    refute_predicate browser, :chrome?
    refute_predicate browser, :bot?
    assert_equal "DuckDuckGo", browser.name
    assert_equal :duckduckgo, browser.id
  end

  test "detects correct version" do
    browser = Browser.new(Browser["DUCKDUCKGO_BROWSER_IOS"])

    assert_equal "7", browser.full_version
    assert_equal "7", browser.version
  end

  test "detects version by range" do
    browser = Browser.new(Browser["DUCKDUCKGO_BROWSER_IOS"])

    assert browser.duck_duck_go?(%w[>=7 <8])
  end
end
