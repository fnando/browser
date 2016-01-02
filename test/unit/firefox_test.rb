require "test_helper"

class FirefoxTest < Minitest::Test
  setup do
    @browser = Browser.new
  end

  test "detects firefox" do
    @browser.ua = Browser["FIREFOX"]

    assert_equal "Firefox", @browser.name
    assert @browser.firefox?
    refute @browser.modern?
    assert_equal "3.8", @browser.full_version
    assert_equal "3", @browser.version
  end

  test "detects modern firefox" do
    @browser.ua = Browser["FIREFOX_MODERN"]

    assert_equal :firefox, @browser.id
    assert_equal "Firefox", @browser.name
    assert @browser.firefox?
    assert @browser.modern?
    assert_equal "17.0", @browser.full_version
    assert_equal "17", @browser.version
  end

  test "detects firefox android tablet" do
    @browser.ua = Browser["FIREFOX_TABLET"]

    assert_equal :firefox, @browser.id
    assert_equal "Firefox", @browser.name
    assert @browser.firefox?
    assert @browser.modern?
    assert @browser.platform.android?
    assert_equal "14.0", @browser.full_version
    assert_equal "14", @browser.version
  end
end
