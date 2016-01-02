require "test_helper"

class KindleTest < Minitest::Test
  setup do
    @browser = Browser.new
  end

  test "detects kindle monochrome" do
    @browser.ua = Browser["KINDLE"]
    assert @browser.webkit?
  end

  test "detects kindle fire" do
    @browser.ua = Browser["KINDLE_FIRE"]
    assert @browser.webkit?
  end

  test "detects kindle fire hd" do
    @browser.ua = Browser["KINDLE_FIRE_HD"]

    assert @browser.webkit?
    assert @browser.modern?
  end

  test "detects kindle fire hd mobile" do
    @browser.ua = Browser["KINDLE_FIRE_HD_MOBILE"]

    assert @browser.webkit?
    assert @browser.modern?
  end
end
