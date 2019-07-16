# frozen_string_literal: true

require "test_helper"

class YandexTest < Minitest::Test
  test "detects Yandex on iOS device" do
    browser = Browser.new(Browser["YANDEX_BROWSER_IOS"])
    assert browser.yandex?
    assert browser.yandex_browser?
    refute browser.safari?
    refute browser.chrome?
    assert_equal "Yandex Browser", browser.name
    assert_equal :yandex_browser, browser.id
  end

  test "detects Yandex on non-iOS devices" do
    browser = Browser.new(Browser["YANDEX_BROWSER_DESKTOP"])
    assert browser.yandex?
    assert browser.yandex_browser?
    refute browser.safari?
    refute browser.chrome?
    assert_equal "Yandex Browser", browser.name
    assert_equal :yandex_browser, browser.id
  end

  test "detects version by range" do
    browser = Browser.new(Browser["YANDEX_BROWSER_DESKTOP"])
    assert browser.yandex?(%w[>=18 <20])
  end
end
