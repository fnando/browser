# frozen_string_literal: true

require "test_helper"

class YandexTest < Minitest::Test
  test "detects yandex browser" do
    browser = Browser.new(Browser["YANDEX_BROWSER"])

    assert browser.yandex?
    refute browser.chrome?
    refute browser.safari?
    assert_equal "19.9.0.1768", browser.full_version
    assert_equal "19", browser.version
  end

  test "detects yandex version by range" do
    browser = Browser.new(Browser["YANDEX_BROWSER"])
    assert browser.yandex?(%w[>=19 <20])
  end
end
