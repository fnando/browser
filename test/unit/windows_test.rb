require "test_helper"

class WindowsTest < Minitest::Test
  setup do
    @browser = Browser.new
  end

  test "detects windows x64" do
    @browser.ua = Browser["IE10_X64_WINX64"]
    assert @browser.platform.windows_x64?
    refute @browser.platform.windows_wow64?
    assert @browser.platform.windows_x64_inclusive?
  end

  test "detects windows wow64" do
    @browser.ua = Browser["WINDOWS_WOW64"]
    refute @browser.platform.windows_x64?
    assert @browser.platform.windows_wow64?
    assert @browser.platform.windows_x64_inclusive?
  end

  test "detects windows platform" do
    @browser.ua = "Windows"
    assert_equal :windows, @browser.platform.id
    assert @browser.platform.windows?
  end

  test "detects windows_xp" do
    @browser.ua = Browser["WINDOWS_XP"]

    assert @browser.platform.windows?
    assert @browser.platform.windows_xp?
  end

  test "detects windows_vista" do
    @browser.ua = Browser["WINDOWS_VISTA"]

    assert @browser.platform.windows?
    assert @browser.platform.windows_vista?
  end

  test "detects windows7" do
    @browser.ua = Browser["WINDOWS7"]

    assert @browser.platform.windows?
    assert @browser.platform.windows7?
  end

  test "detects windows8" do
    @browser.ua = Browser["WINDOWS8"]

    assert @browser.platform.windows?
    assert @browser.platform.windows8?
    refute @browser.platform.windows8_1?
  end

  test "detects windows8.1" do
    @browser.ua = Browser["WINDOWS81"]

    assert @browser.platform.windows?
    assert @browser.platform.windows8?
    assert @browser.platform.windows8_1?
  end
end
