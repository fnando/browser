require "test_helper"

class WindowPhoneTest < Minitest::Test
  setup do
    @browser = Browser.new
  end

  test "detects windows phone" do
    @browser.ua = $ua["WINDOWS_PHONE"]

    assert @browser.ie?
    assert_equal "7", @browser.version
    assert @browser.mobile?
    assert @browser.windows_phone?
    refute @browser.windows_mobile?
    refute @browser.tablet?
  end

  test "detects windows phone 8" do
    @browser.ua = $ua["WINDOWS_PHONE8"]

    assert @browser.ie?
    assert_equal "10", @browser.version
    assert @browser.mobile?
    assert @browser.windows_phone?
    refute @browser.windows_mobile?
    refute @browser.tablet?
  end

  test "detects windows phone 8.1" do
    @browser.ua = $ua["WINDOWS_PHONE_81"]

    assert @browser.ie?
    assert_equal "Internet Explorer", @browser.name
    assert_equal :ie, @browser.id
    assert_equal "11", @browser.version
    assert_equal "11.0", @browser.full_version
    assert @browser.mobile?
    assert @browser.windows_phone?
    refute @browser.windows_mobile?
    refute @browser.tablet?
  end

  test "detects windows mobile (windows phone 8)" do
    @browser.ua = $ua["WINDOWS_PHONE8"]

    assert @browser.ie?
    assert_equal "10", @browser.version
    assert @browser.mobile?
    assert @browser.windows_phone?
    refute @browser.windows_mobile?
    refute @browser.tablet?
  end
end
