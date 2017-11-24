# frozen_string_literal: true

require "test_helper"

class YandexTest < Minitest::Test
  test "detects yandex browser" do
    browser = Browser.new(Browser["YANDEX_BROWSER"])

    assert browser.yandex?
    refute browser.chrome?
    refute browser.safari?
    assert browser.webkit?
    assert browser.chromium?
    assert_equal "41.0.2272.118", browser.full_version
    assert_equal "41", browser.version
  end

  test "detects yandex version by range" do
    browser = Browser.new(Browser["YANDEX_BROWSER"])
    assert browser.yandex?(%w[>=41 <42])
  end
end
