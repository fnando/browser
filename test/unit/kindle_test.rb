require "test_helper"

class KindleTest < Minitest::Test
  setup do
    @browser = Browser.new
  end

  test "detects kindle monochrome" do
    @browser.ua = $ua["KINDLE"]

    assert @browser.kindle?
    assert @browser.webkit?
  end

  test "detects kindle fire" do
    @browser.ua = $ua["KINDLE_FIRE"]

    assert @browser.kindle?
    assert @browser.webkit?
  end

  test "detects kindle fire hd" do
    @browser.ua = $ua["KINDLE_FIRE_HD"]

    assert @browser.silk?
    assert @browser.kindle?
    assert @browser.webkit?
    assert @browser.modern?
    refute @browser.mobile?
  end

  test "detects kindle fire hd mobile" do
    @browser.ua = $ua["KINDLE_FIRE_HD_MOBILE"]

    assert @browser.silk?
    assert @browser.kindle?
    assert @browser.webkit?
    assert @browser.modern?
    assert @browser.mobile?
  end
end
