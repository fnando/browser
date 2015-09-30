require "test_helper"

class ChromeTest < Minitest::Test
  setup do
    @browser = Browser.new
  end

  test "detects chrome" do
    @browser.ua = $ua["CHROME"]

    assert_equal "Chrome", @browser.name
    assert @browser.chrome?
    refute @browser.safari?
    assert @browser.webkit?
    assert @browser.modern?
    assert_equal "5.0.375.99", @browser.full_version
    assert_equal "5", @browser.version
  end

  test "detects mobile chrome" do
    @browser.ua = $ua["MOBILE_CHROME"]

    assert_equal "Chrome", @browser.name
    assert @browser.chrome?
    refute @browser.safari?
    assert @browser.webkit?
    assert @browser.modern?
    assert_equal "19.0.1084.60", @browser.full_version
    assert_equal "19", @browser.version
  end

  test "detects samsung chrome" do
    @browser.ua = $ua["SAMSUNG_CHROME"]

    assert_equal "Chrome", @browser.name
    assert @browser.chrome?
    assert @browser.android?
    refute @browser.safari?
    assert @browser.webkit?
    assert @browser.modern?
    assert_equal "28.0.1500.94", @browser.full_version
    assert_equal "28", @browser.version
  end

  test "detects chrome os" do
    @browser.ua = $ua["CHROME_OS"]
    assert @browser.chrome_os?
  end

  test "detects yandex browser" do
    @browser.ua = $ua["YANDEX_BROWSER"]

    assert @browser.yandex?
    assert @browser.chrome?
    refute @browser.safari?
    assert @browser.webkit?
    assert_equal "41.0.2272.118", @browser.full_version
    assert_equal "41", @browser.version
  end
end
