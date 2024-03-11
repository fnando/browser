# frozen_string_literal: true

require "test_helper"

class SafariTest < Minitest::Test
  test "detects safari 3" do
    browser = Browser.new(Browser["SAFARI3"])

    assert browser.safari?
    assert browser.safari?("~>3.0")
    assert_equal "3", browser.version
    assert_equal "3.0.3", browser.full_version
  end

  test "detects safari 4" do
    browser = Browser.new(Browser["SAFARI4"])

    assert browser.safari?
    assert browser.safari?("~>4.0")
    assert_equal "4", browser.version
    assert_equal "4.0.3", browser.full_version
  end

  test "detects safari 5" do
    browser = Browser.new(Browser["SAFARI5"])

    assert browser.safari?
    assert browser.safari?("~>5.0")
    assert_equal "5", browser.version
    assert_equal "5.0.3", browser.full_version
  end

  test "detects safari 6" do
    browser = Browser.new(Browser["SAFARI6"])

    assert browser.safari?
    assert browser.safari?("~>6.0")
    assert_equal "6", browser.version
    assert_equal "6.0", browser.full_version
  end

  test "detects safari 7" do
    browser = Browser.new(Browser["SAFARI7"])

    assert browser.safari?
    assert browser.safari?("~>7.0")
    assert_equal "7", browser.version
    assert_equal "7.0", browser.full_version
  end

  test "detects safari 8" do
    browser = Browser.new(Browser["SAFARI8"])

    assert browser.safari?
    assert browser.safari?("~>8.0")
    assert_equal "8", browser.version
    assert_equal "8.0", browser.full_version
  end

  test "detects safari 9" do
    browser = Browser.new(Browser["SAFARI9"])

    assert browser.safari?
    assert browser.safari?("~>9.0")
    assert_equal "9", browser.version
    assert_equal "9.0.2", browser.full_version
  end

  test "detects web app mode" do
    browser = Browser.new(Browser["SAFARI_IPHONE_WEBAPP_MODE"])

    assert browser.safari_webapp_mode?
  end

  test "rejects regular safari as web app mode" do
    browser = Browser.new(Browser["SAFARI9"])

    refute browser.safari_webapp_mode?
  end

  test "returns webkit version" do
    browser = Browser.new(Browser["SAFARI9"])

    assert_equal "601.3.9", browser.webkit_full_version
  end

  test "detects webkit version by range" do
    browser = Browser.new(Browser["SAFARI9"])
    assert browser.webkit?(%w[>=601 <602])
  end

  test "detects safari version by range" do
    browser = Browser.new(Browser["SAFARI9"])
    assert browser.safari?(%w[>=9.0 <10])
  end

  test "does not detect as chromium" do
    browser = Browser.new(Browser["SAFARI9"])
    refute browser.chromium_based?
  end
end
