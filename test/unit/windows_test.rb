require "test_helper"

class WindowsTest < Minitest::Test
  setup do
    @browser = Browser.new
  end

  test "detects windows x64" do
    @browser.ua = $ua["IE10_X64_WINX64"]
    assert @browser.windows_x64?
    refute @browser.windows_wow64?
    assert @browser.windows_x64_inclusive?
  end

  test "detects windows wow64" do
    @browser.ua = $ua["WINDOWS_WOW64"]
    refute @browser.windows_x64?
    assert @browser.windows_wow64?
    assert @browser.windows_x64_inclusive?
  end

  test "detects windows platform" do
    @browser.ua = "Windows"
    assert_equal :windows, @browser.platform
    assert @browser.windows?
  end

  test "detects windows_xp" do
    @browser.ua = $ua["WINDOWS_XP"]

    assert @browser.windows?
    assert @browser.windows_xp?
  end

  test "detects windows_vista" do
    @browser.ua = $ua["WINDOWS_VISTA"]

    assert @browser.windows?
    assert @browser.windows_vista?
  end

  test "detects windows7" do
    @browser.ua = $ua["WINDOWS7"]

    assert @browser.windows?
    assert @browser.windows7?
  end

  test "detects windows8" do
    @browser.ua = $ua["WINDOWS8"]

    assert @browser.windows?
    assert @browser.windows8?
    refute @browser.windows8_1?
  end

  test "detects windows8.1" do
    @browser.ua = $ua["WINDOWS81"]

    assert @browser.windows?
    assert @browser.windows8?
    assert @browser.windows8_1?
  end
end
