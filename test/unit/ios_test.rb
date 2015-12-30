require "test_helper"

class IosTest < Minitest::Test
  setup do
    @browser = Browser.new
  end

  test "detects iphone" do
    @browser.ua = $ua["IPHONE"]

    assert_equal "iPhone", @browser.name
    assert @browser.iphone?
    assert @browser.safari?
    assert @browser.webkit?
    assert @browser.mobile?
    assert @browser.modern?
    assert @browser.ios?
    refute @browser.tablet?
    refute @browser.mac?
    assert_equal "3.0", @browser.full_version
    assert_equal "3", @browser.version
  end

  test "detects safari" do
    @browser.ua = $ua["SAFARI"]

    assert_equal "Safari", @browser.name
    assert @browser.safari?
    assert @browser.webkit?
    assert @browser.modern?
    assert_equal "5.0.1", @browser.full_version
    assert_equal "5", @browser.version
  end

  test "detects safari in webapp mode" do
    @browser.ua = $ua["SAFARI_IPAD_WEBAPP_MODE"]
    refute @browser.safari?
    assert @browser.ios_webview?

    @browser.ua = $ua["SAFARI_IPHONE_WEBAPP_MODE"]
    refute @browser.safari?
    assert @browser.ios_webview?
  end

  test "detects ipod" do
    @browser.ua = $ua["IPOD"]

    assert_equal "iPod Touch", @browser.name
    assert @browser.ipod?
    assert @browser.safari?
    assert @browser.webkit?
    assert @browser.mobile?
    assert @browser.modern?
    assert @browser.ios?
    refute @browser.tablet?
    refute @browser.mac?
    assert_equal "3.0", @browser.full_version
    assert_equal "3", @browser.version
  end

  test "detects ipad" do
    @browser.ua = $ua["IPAD"]

    assert_equal "iPad", @browser.name
    assert @browser.ipad?
    assert @browser.safari?
    assert @browser.webkit?
    assert @browser.modern?
    assert @browser.ios?
    assert @browser.tablet?
    refute @browser.mobile?
    refute @browser.mac?
    assert_equal "4.0.4", @browser.full_version
    assert_equal "4", @browser.version
  end

  test "detects ios4" do
    @browser.ua = $ua["IOS4"]
    assert @browser.ios?
    assert @browser.ios?(4)
    refute @browser.mac?
  end


  test "detects ios5" do
    @browser.ua = $ua["IOS5"]
    assert @browser.ios?
    assert @browser.ios?(5)
    refute @browser.mac?
  end

  test "detects ios6" do
    @browser.ua = $ua["IOS6"]
    assert @browser.ios?
    assert @browser.ios?(6)
    refute @browser.mac?
  end

  test "detects ios7" do
    @browser.ua = $ua["IOS7"]
    assert @browser.ios?
    assert @browser.ios?(7)
    refute @browser.mac?
  end

  test "detects ios8" do
    @browser.ua = $ua["IOS8"]
    assert @browser.ios?
    assert @browser.ios?(8)
    refute @browser.mac?
  end

  test "detects ios9" do
    @browser.ua = $ua["IOS9"]
    assert @browser.ios?
    assert @browser.ios?(9)
    refute @browser.mac?
  end

  test "don't detect as two different versions" do
    @browser.ua = $ua["IOS8"]
    assert @browser.ios?(8)
    refute @browser.ios?(7)
  end

  test "warn about deprecated numbered version" do
    message = "Browser#ios8? is deprecated; use Browser#ios?(version) instead"
    assert_deprecated(message, __FILE__, __LINE__) { @browser.ios8? }
  end

  test "returns string representation for ios" do
    @browser.ua = $ua["IPHONE"]
    meta = @browser.to_s

    assert meta.include?("iphone")
    assert meta.include?("webkit")
    assert meta.include?("ios")
    assert meta.include?("safari")
    assert meta.include?("safari3")
    assert meta.include?("modern")
    assert meta.include?("mobile")
  end
end
