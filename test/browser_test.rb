require "test_helper"

class BrowserTest < Minitest::Test
  setup do
    @browser = Browser.new
  end

  test "yields self when block is given" do
    browser = nil
    Browser.new {|b| browser = b }
    assert_kind_of Browser, browser
  end

  test "responds to ua methods" do
    assert @browser.respond_to?(:ua)
    assert @browser.respond_to?(:ua=)
  end

  test "delegates ua methods" do
    @browser.user_agent = "Safari"
    assert_equal "Safari", @browser.ua

    @browser.ua = "Mozilla"
    assert_equal "Mozilla", @browser.user_agent
  end

  test "sets accept language while instantiating object" do
    @browser = Browser.new(:accept_language => "pt-br")
    assert_equal ["pt-br"], @browser.accept_language
  end

  test "sets user agent while instantianting object" do
    @browser = Browser.new(:ua => "Safari")
    assert_equal "Safari", @browser.ua

    @browser = Browser.new(:user_agent => "Chrome")
    assert_equal "Chrome", @browser.ua
  end

  test "detects android" do
    @browser.ua = $ua["ANDROID"]

    assert_equal "Android", @browser.name
    assert @browser.android?
    refute @browser.safari?
    assert @browser.webkit?
    assert @browser.mobile?
    refute @browser.tablet?
    assert @browser.modern?
    assert_equal "3.1.2", @browser.full_version
    assert_equal "3", @browser.version
  end

  test "detects android tablet" do
    @browser.ua = $ua["TABLOID"]

    assert_equal "Android", @browser.name
    assert @browser.android?
    refute @browser.safari?
    assert @browser.webkit?
    refute @browser.mobile?
    assert @browser.tablet?
    assert @browser.modern?
    assert_equal "4.0", @browser.full_version
    assert_equal "4", @browser.version
  end

  test "detects surface tablet" do
    @browser.ua = $ua["SURFACE"]

    assert_equal "Internet Explorer", @browser.name
    assert @browser.surface?
    assert @browser.ie?
    refute @browser.mobile?
    assert @browser.tablet?
    assert @browser.modern?
    assert_equal "10.0", @browser.full_version
    assert_equal "10", @browser.version
  end

  test "detects quicktime" do
    @browser.ua = $ua["QUICKTIME"]

    assert_equal "QuickTime", @browser.name
    assert @browser.quicktime?
    assert_equal "7.6.8", @browser.full_version
    assert_equal "7", @browser.version
  end

  test "detects core media" do
    @browser.ua = $ua["COREMEDIA"]

    assert_equal "Apple CoreMedia", @browser.name
    assert @browser.core_media?
    assert_equal "1.0.0.10F569", @browser.full_version
    assert_equal "1", @browser.version
  end

  test "detects phantom.js" do
    @browser.ua = $ua["PHANTOM_JS"]

    assert_equal "PhantomJS", @browser.name
    assert @browser.phantom_js?
    refute @browser.tablet?
    refute @browser.mobile?
    assert @browser.modern?
    assert_equal "1.9.0", @browser.full_version
    assert_equal "1", @browser.version
  end

  test "detects other mobiles" do
    @browser.ua = "Symbian OS"
    assert @browser.mobile?
    refute @browser.tablet?

    @browser.ua = "MIDP-2.0"
    assert @browser.mobile?
    refute @browser.tablet?
  end

  test "detects windows mobile" do
    @browser.ua = $ua["WINDOWS_MOBILE"]

    assert @browser.mobile?
    assert @browser.windows?
    assert @browser.windows_mobile?
    refute @browser.windows_phone?
    refute @browser.tablet?
  end

  test "returns a zero version" do
    @browser.ua = "Bot"
    assert_equal "0.0", @browser.full_version
    assert_equal "0", @browser.version
  end

  test "sets meta" do
    @browser.ua = $ua["CHROME"]
    assert_kind_of Array, @browser.meta
  end

  test "returns string representation" do
    @browser.ua = $ua["CHROME"]
    meta = @browser.to_s

    assert meta.include?("chrome")
    assert meta.include?("webkit")
    assert meta.include?("mac")
    assert meta.include?("modern")
  end

  test "returns string representation for mobile" do
    @browser.ua = $ua["BLACKBERRY"]
    meta = @browser.to_s

    assert meta.include?("blackberry")
    assert meta.include?("blackberry4")
    assert meta.include?("other")
    assert meta.include?("mobile")
  end

  test "detects unknown id" do
    @browser.ua = "Unknown"
    assert_equal :other, @browser.id
  end

  test "detects unknown name" do
    @browser.ua = "Unknown"
    assert_equal "Other", @browser.name
  end

  test "detects mac platform" do
    @browser.ua = "Mac OS X"
    assert_equal :mac, @browser.platform
    assert @browser.mac?
  end

  test "detects linux platform" do
    @browser.ua = "Linux"
    assert_equal :linux, @browser.platform
    assert @browser.linux?
  end

  test "detects unknown platform" do
    @browser.ua = "Unknown"
    assert_equal :other, @browser.platform
  end

  test "returns all known languages" do
    @browser.accept_language = "en-us,en;q=0.8,pt-br;q=0.5,pt;q=0.3"
    assert_equal ["en-us", "en", "pt-br", "pt"], @browser.accept_language
  end

  test "detects xoom" do
    @browser.ua = $ua["XOOM"]

    assert @browser.android?
    assert @browser.tablet?
    refute @browser.mobile?
  end

  test "detects nexus tablet" do
    @browser.ua = $ua["NEXUS_TABLET"]

    assert @browser.android?
    assert @browser.tablet?
    refute @browser.mobile?
  end

  test "detects nook" do
    @browser.ua = $ua["NOOK"]

    assert @browser.tablet?
    refute @browser.mobile?
  end

  test "detects samsung" do
    @browser.ua = $ua["SAMSUNG"]

    assert @browser.tablet?
    refute @browser.mobile?
  end

  test "removes duplicate items" do
    @browser.ua = $ua["SAFARI"]
    assert_equal ["safari"], @browser.meta.select {|item| item == "safari" }
  end

  test "detects meta aliased as to_a" do
    @browser.ua = $ua["SAFARI"]
    assert_equal @browser.meta, @browser.to_a
  end

  test "detects tv" do
    @browser.ua = $ua["SMART_TV"]
    assert @browser.tv?
  end

  test "knows a supported browser" do
    @browser.ua = "Chrome"
    assert @browser.known?
  end

  test "does not know an unsupported browser" do
    @browser.ua = "Fancy new browser"
    refute @browser.known?
  end
end
