# -*- encoding: utf-8 -*-
require "spec_helper"

describe Browser do
  before do
    @browser = Browser.new
    Browser::Bots.instance_variable_set("@detect_empty_ua", false)
  end

  it "yields self when block is given" do
    browser = nil
    Browser.new {|b| browser = b }
    assert_kind_of Browser, browser
  end

  it "responds to ua methods" do
    assert @browser.respond_to?(:ua)
    assert @browser.respond_to?(:ua=)
  end

  it "delegates ua methods" do
    @browser.user_agent = "Safari"
    assert_equal "Safari", @browser.ua

    @browser.ua = "Mozilla"
    assert_equal "Mozilla", @browser.user_agent
  end

  it "sets accept language while instantiating object" do
    @browser = Browser.new(:accept_language => "pt-br")
    assert_equal ["pt-br"], @browser.accept_language
  end

  it "sets user agent while instantianting object" do
    @browser = Browser.new(:ua => "Safari")
    assert_equal "Safari", @browser.ua

    @browser = Browser.new(:user_agent => "Chrome")
    assert_equal "Chrome", @browser.ua
  end

  it "detects iphone" do
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

  it "detects safari" do
    @browser.ua = $ua["SAFARI"]

    assert_equal "Safari", @browser.name
    assert @browser.safari?
    assert @browser.webkit?
    assert @browser.modern?
    assert_equal "5.0.1", @browser.full_version
    assert_equal "5", @browser.version
  end

  it "detects safari in webapp mode" do
    @browser.ua = $ua["SAFARI_IPAD_WEBAPP_MODE"]
    assert @browser.safari?

    @browser.ua = $ua["SAFARI_IPHONE_WEBAPP_MODE"]
    assert @browser.safari?
  end

  it "detects ipod" do
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

  it "detects ipad" do
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

  it "detects ios4" do
    @browser.ua = $ua["IOS4"]
    assert @browser.ios?
    assert @browser.ios4?
    refute @browser.mac?
  end


  it "detects ios5" do
    @browser.ua = $ua["IOS5"]
    assert @browser.ios?
    assert @browser.ios5?
    refute @browser.mac?
  end

  it "detects ios6" do
    @browser.ua = $ua["IOS6"]
    assert @browser.ios?
    assert @browser.ios6?
    refute @browser.mac?
  end

  it "detects ios7" do
    @browser.ua = $ua["IOS7"]
    assert @browser.ios?
    assert @browser.ios7?
    refute @browser.mac?
  end

  it "detects ios8" do
    @browser.ua = $ua["IOS8"]
    assert @browser.ios?
    assert @browser.ios8?
    refute @browser.mac?
  end

  it "detects ie6" do
    @browser.ua = $ua["IE6"]

    assert_equal "Internet Explorer", @browser.name
    assert @browser.ie?
    assert @browser.ie6?
    refute @browser.modern?
    assert_equal "6.0", @browser.full_version
    assert_equal "6", @browser.version
  end

  it "detects ie7" do
    @browser.ua = $ua["IE7"]

    assert_equal "Internet Explorer", @browser.name
    assert @browser.ie?
    assert @browser.ie7?
    refute @browser.modern?
    assert_equal "7.0", @browser.full_version
    assert_equal "7", @browser.version
  end

  it "detects ie8" do
    @browser.ua = $ua["IE8"]

    assert_equal "Internet Explorer", @browser.name
    assert @browser.ie?
    assert @browser.ie8?
    refute @browser.modern?
    refute @browser.compatibility_view?
    assert_equal "8.0", @browser.full_version
    assert_equal "8", @browser.version
  end

  it "detects ie8 in compatibility view" do
    @browser.ua = $ua["IE8_COMPAT"]

    assert_equal "Internet Explorer", @browser.name
    assert @browser.ie?
    assert @browser.ie7?
    refute @browser.ie8?
    refute @browser.modern?
    assert @browser.compatibility_view?
    assert_equal "7.0", @browser.full_version
    assert_equal "7", @browser.version
  end

  it "detects ie9" do
    @browser.ua = $ua["IE9"]

    assert_equal "Internet Explorer", @browser.name
    assert @browser.ie?
    assert @browser.ie9?
    assert @browser.modern?
    refute @browser.compatibility_view?
    assert_equal "9.0", @browser.full_version
    assert_equal "9", @browser.version
  end

  it "detects ie9 in compatibility view" do
    @browser.ua = $ua["IE9_COMPAT"]

    assert_equal "Internet Explorer", @browser.name
    assert @browser.ie?
    assert @browser.ie7?
    refute @browser.ie9?
    refute @browser.modern?
    assert @browser.compatibility_view?
    assert_equal "7.0", @browser.full_version
    assert_equal "7", @browser.version
  end

  it "detects ie10" do
    @browser.ua = $ua["IE10"]

    assert_equal "Internet Explorer", @browser.name
    assert @browser.ie?
    assert @browser.ie10?
    assert @browser.modern?
    refute @browser.compatibility_view?
    assert_equal "10.0", @browser.full_version
    assert_equal "10", @browser.version
  end

  it "detects ie10 in compatibility view" do
    @browser.ua = $ua["IE10_COMPAT"]

    assert_equal "Internet Explorer", @browser.name
    assert @browser.ie?
    assert @browser.ie7?
    refute @browser.ie10?
    refute @browser.modern?
    assert @browser.compatibility_view?
    assert_equal "7.0", @browser.full_version
    assert_equal "7", @browser.version
  end

  it "detects ie11" do
    @browser.ua = $ua["IE11"]

    assert_equal "Internet Explorer", @browser.name
    assert @browser.ie?
    assert @browser.ie11?
    assert @browser.modern?
    refute @browser.compatibility_view?
    assert_equal "11.0", @browser.full_version
    assert_equal "11", @browser.version
  end

  it "detects opera" do
    @browser.ua = $ua["OPERA"]

    assert_equal "Opera", @browser.name
    assert @browser.opera?
    refute @browser.modern?
    assert_equal "11.64", @browser.full_version
    assert_equal "11", @browser.version
  end

  it "detects opera next" do
    @browser.ua = $ua["OPERA_NEXT"]

    assert_equal "Opera", @browser.name
    assert_equal :opera, @browser.id
    assert @browser.opera?
    assert @browser.webkit?
    assert @browser.modern?
    refute @browser.chrome?
    assert_equal "15.0.1147.44", @browser.full_version
    assert_equal "15", @browser.version
  end

  it "detects firefox" do
    @browser.ua = $ua["FIREFOX"]

    assert_equal "Firefox", @browser.name
    assert @browser.firefox?
    refute @browser.modern?
    assert_equal "3.8", @browser.full_version
    assert_equal "3", @browser.version
  end

  it "detects modern firefox" do
    @browser.ua = $ua["FIREFOX_MODERN"]

    assert_equal "Firefox", @browser.name
    assert @browser.firefox?
    assert @browser.modern?
    assert_equal "17.0", @browser.full_version
    assert_equal "17", @browser.version
  end

  it "detects firefox android tablet" do
    @browser.ua = $ua["FIREFOX_TABLET"]

    assert_equal "Android", @browser.name
    assert @browser.firefox?
    assert @browser.modern?
    assert @browser.tablet?
    assert @browser.android?
    assert_equal "14.0", @browser.full_version
    assert_equal "14", @browser.version
  end

  it "detects chrome" do
    @browser.ua = $ua["CHROME"]

    assert_equal "Chrome", @browser.name
    assert @browser.chrome?
    refute @browser.safari?
    assert @browser.webkit?
    assert @browser.modern?
    assert_equal "5.0.375.99", @browser.full_version
    assert_equal "5", @browser.version
  end

  it "detects mobile chrome" do
    @browser.ua = $ua["MOBILE_CHROME"]

    assert_equal "Chrome", @browser.name
    assert @browser.chrome?
    refute @browser.safari?
    assert @browser.webkit?
    assert @browser.modern?
    assert_equal "19.0.1084.60", @browser.full_version
    assert_equal "19", @browser.version
  end

  it "detects samsung chrome" do
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

  it "detects android" do
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

  it "detects android tablet" do
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

  it "detects surface tablet" do
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

  it "detects blackberry" do
    @browser.ua = $ua["BLACKBERRY"]

    assert_equal "BlackBerry", @browser.name
    assert @browser.blackberry?
    refute @browser.tablet?
    assert @browser.mobile?
    refute @browser.modern?
    assert_equal "4.1.0", @browser.full_version
    assert_equal "4", @browser.version
  end

  it "detects blackberry4" do
    @browser.ua = $ua["BLACKBERRY4"]

    assert_equal "BlackBerry", @browser.name
    assert @browser.blackberry4?
    refute @browser.tablet?
    assert @browser.mobile?
    refute @browser.modern?
    assert_equal "4.2.1", @browser.full_version
    assert_equal "4", @browser.version
  end

  it "detects blackberry5" do
    @browser.ua = $ua["BLACKBERRY5"]

    assert_equal "BlackBerry", @browser.name
    assert @browser.blackberry5?
    refute @browser.tablet?
    assert @browser.mobile?
    refute @browser.modern?
    assert_equal "5.0.0.93", @browser.full_version
    assert_equal "5", @browser.version
  end

  it "detects blackberry6" do
    @browser.ua = $ua["BLACKBERRY6"]

    assert_equal "BlackBerry", @browser.name
    assert @browser.blackberry6?
    refute @browser.tablet?
    assert @browser.mobile?
    assert @browser.modern?
    assert_equal "534.11", @browser.full_version
    assert_equal "534", @browser.version
  end

  it "detects blackberry7" do
    @browser.ua = $ua["BLACKBERRY7"]

    assert_equal "BlackBerry", @browser.name
    assert @browser.blackberry7?
    refute @browser.tablet?
    assert @browser.mobile?
    assert @browser.modern?
    assert_equal "534.11", @browser.full_version
    assert_equal "534", @browser.version
  end

  it "detects blackberry10" do
    @browser.ua = $ua["BLACKBERRY10"]

    assert_equal "Safari", @browser.name
    assert @browser.blackberry10?
    refute @browser.tablet?
    assert @browser.mobile?
    assert @browser.modern?
    assert_equal "10.0.9.1675", @browser.full_version
    assert_equal "10", @browser.version
  end

  it "detects quicktime" do
    @browser.ua = $ua["QUICKTIME"]

    assert_equal "QuickTime", @browser.name
    assert @browser.quicktime?
    assert_equal "7.6.8", @browser.full_version
    assert_equal "7", @browser.version
  end

  it "detects core media" do
    @browser.ua = $ua["COREMEDIA"]

    assert_equal "Apple CoreMedia", @browser.name
    assert @browser.core_media?
    assert_equal "1.0.0.10F569", @browser.full_version
    assert_equal "1", @browser.version
  end

  it "detects phantom.js" do
    @browser.ua = $ua["PHANTOM_JS"]

    assert_equal "PhantomJS", @browser.name
    assert @browser.phantom_js?
    refute @browser.tablet?
    refute @browser.mobile?
    assert @browser.modern?
    assert_equal "1.9.0", @browser.full_version
    assert_equal "1", @browser.version
  end

  it "detects psp" do
    @browser.ua = $ua["PSP"]

    assert_equal "PlayStation Portable", @browser.name
    assert @browser.psp?
    refute @browser.psp_vita?
    assert @browser.mobile?
  end

  it "detects psp vita" do
    @browser.ua = $ua["PSP_VITA"]

    assert_equal "PlayStation Portable", @browser.name
    assert @browser.psp?
    assert @browser.psp_vita?
    assert @browser.mobile?
  end

  it "detects other mobiles" do
    @browser.ua = "Symbian OS"
    assert @browser.mobile?
    refute @browser.tablet?

    @browser.ua = "MIDP-2.0"
    assert @browser.mobile?
    refute @browser.tablet?
  end

  it "detects windows mobile" do
    @browser.ua = $ua["WINDOWS_MOBILE"]

    assert @browser.mobile?
    assert @browser.windows?
    assert @browser.windows_mobile?
    refute @browser.windows_phone?
    refute @browser.tablet?
  end

  it "returns a zero version" do
    @browser.ua = "Bot"
    assert_equal "0.0", @browser.full_version
    assert_equal "0", @browser.version
  end

  it "sets meta" do
    @browser.ua = $ua["CHROME"]
    assert_kind_of Array, @browser.meta
  end

  it "returns string representation" do
    @browser.ua = $ua["CHROME"]
    meta = @browser.to_s

    assert meta.include?("chrome")
    assert meta.include?("webkit")
    assert meta.include?("mac")
    assert meta.include?("modern")
  end

  it "returns string representation for ios" do
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

  it "returns string representation for mobile" do
    @browser.ua = $ua["BLACKBERRY"]
    meta = @browser.to_s

    assert meta.include?("blackberry")
    assert meta.include?("blackberry4")
    assert meta.include?("other")
    assert meta.include?("mobile")
  end

  it "returns string representation for ie6" do
    @browser.ua = $ua["IE6"]
    meta = @browser.meta

    assert meta.include?("ie")
    assert meta.include?("ie6")
    assert meta.include?("oldie")
    assert meta.include?("lt-ie8")
    assert meta.include?("lt-ie9")
    assert meta.include?("windows")
  end

  it "returns string representation for ie7" do
    @browser.ua = $ua["IE7"]
    meta = @browser.meta

    assert meta.include?("ie")
    assert meta.include?("ie7")
    assert meta.include?("oldie")
    assert meta.include?("lt-ie8")
    assert meta.include?("lt-ie9")
    assert meta.include?("windows")
  end

  it "returns string representation for ie8" do
    @browser.ua = $ua["IE8"]
    meta = @browser.meta

    assert meta.include?("ie")
    assert meta.include?("ie8")
    assert meta.include?("lt-ie9")
    assert meta.include?("windows")
  end

  it "detects unknown id" do
    @browser.ua = "Unknown"
    assert_equal :other, @browser.id
  end

  it "detects unknown name" do
    @browser.ua = "Unknown"
    assert_equal "Other", @browser.name
  end

  it "detects mac platform" do
    @browser.ua = "Mac OS X"
    assert_equal :mac, @browser.platform
    assert @browser.mac?
  end

  it "detects windows platform" do
    @browser.ua = "Windows"
    assert_equal :windows, @browser.platform
    assert @browser.windows?
  end

  it "detects windows8" do
    @browser.ua = $ua["WINDOWS8"]

    assert @browser.windows?
    assert @browser.windows8?
  end

  it "detects windows8.1" do
    @browser.ua = $ua["WINDOWS81"]

    assert @browser.windows?
    assert @browser.windows8?
  end

  it "detects linux platform" do
    @browser.ua = "Linux"
    assert_equal :linux, @browser.platform
    assert @browser.linux?
  end

  it "detects unknown platform" do
    @browser.ua = "Unknown"
    assert_equal :other, @browser.platform
  end

  it "returns all known languages" do
    @browser.accept_language = "en-us,en;q=0.8,pt-br;q=0.5,pt;q=0.3"
    assert_equal ["en-us", "en", "pt-br", "pt"], @browser.accept_language
  end

  it "detects xoom" do
    @browser.ua = $ua["XOOM"]

    assert @browser.android?
    assert @browser.tablet?
    refute @browser.mobile?
  end

  it "detects nexus tablet" do
    @browser.ua = $ua["NEXUS_TABLET"]

    assert @browser.android?
    assert @browser.tablet?
    refute @browser.mobile?
  end

  it "detects blackberry playbook tablet" do
    @browser.ua = $ua["PLAYBOOK"]

    refute @browser.android?
    assert @browser.tablet?
    refute @browser.mobile?

    assert_equal "7.2.1.0", @browser.full_version
    assert_equal "7", @browser.version
  end

  it "detects opera mini" do
    @browser.ua = $ua["OPERA_MINI"]

    assert @browser.opera_mini?
    refute @browser.tablet?
    assert @browser.mobile?
  end

  it "detects opera mobi" do
    @browser.ua = $ua["OPERA_MOBI"]

    assert @browser.opera?
    refute @browser.tablet?
    assert @browser.mobile?
  end

  it "detects windows phone" do
    @browser.ua = $ua["WINDOWS_PHONE"]

    assert @browser.ie?
    assert_equal "7", @browser.version
    assert @browser.mobile?
    assert @browser.windows_phone?
    refute @browser.windows_mobile?
    refute @browser.tablet?
  end

  it "detects windows phone 8" do
    @browser.ua = $ua["WINDOWS_PHONE8"]

    assert @browser.ie?
    assert_equal "10", @browser.version
    assert @browser.mobile?
    assert @browser.windows_phone?
    refute @browser.windows_mobile?
    refute @browser.tablet?
  end

  it "detects windows phone 8.1" do
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

  it "detects windows mobile" do
    @browser.ua = $ua["WINDOWS_PHONE8"]

    assert @browser.ie?
    assert_equal "10", @browser.version
    assert @browser.mobile?
    assert @browser.windows_phone?
    refute @browser.windows_mobile?
    refute @browser.tablet?
  end

  it "detects windows x64" do
    @browser.ua = $ua["IE10_X64_WINX64"]
    assert @browser.windows_x64?
  end

  it "detects ie11 touch desktop pc" do
    @browser.ua = $ua["IE11_TOUCH_SCREEN"]

    assert_equal "Internet Explorer", @browser.name
    assert @browser.ie?
    assert @browser.ie11?
    assert @browser.modern?
    refute @browser.compatibility_view?
    refute @browser.windows_rt?
    assert @browser.windows_touchscreen_desktop?
    assert @browser.windows8?
    assert_equal "11.0", @browser.full_version
    assert_equal "11", @browser.version
  end

  it "detects kindle monochrome" do
    @browser.ua = $ua["KINDLE"]

    assert @browser.kindle?
    assert @browser.webkit?
  end

  it "detects kindle fire" do
    @browser.ua = $ua["KINDLE_FIRE"]

    assert @browser.kindle?
    assert @browser.webkit?
  end

  it "detects kindle fire hd" do
    @browser.ua = $ua["KINDLE_FIRE_HD"]

    assert @browser.silk?
    assert @browser.kindle?
    assert @browser.webkit?
    assert @browser.modern?
    refute @browser.mobile?
  end

  it "detects kindle fire hd mobile" do
    @browser.ua = $ua["KINDLE_FIRE_HD_MOBILE"]

    assert @browser.silk?
    assert @browser.kindle?
    assert @browser.webkit?
    assert @browser.modern?
    assert @browser.mobile?
  end

  it "detects nook" do
    @browser.ua = $ua["NOOK"]

    assert @browser.tablet?
    refute @browser.mobile?
  end

  it "detects samsung" do
    @browser.ua = $ua["SAMSUNG"]

    assert @browser.tablet?
    refute @browser.mobile?
  end

  it "detects nintendo wii" do
    @browser.ua = $ua["NINTENDO_WII"]

    assert @browser.console?
    assert @browser.nintendo?
  end

  it "detects nintendo wii u" do
    @browser.ua = $ua["NINTENDO_WIIU"]

    assert @browser.console?
    assert @browser.nintendo?
  end

  it "detects playstation 3" do
    @browser.ua = $ua["PLAYSTATION3"]

    assert @browser.console?
    assert @browser.playstation?
    refute @browser.playstation4?
  end

  it "detects playstation 4" do
    @browser.ua = $ua["PLAYSTATION4"]

    assert @browser.console?
    assert @browser.playstation?
    assert @browser.playstation4?
  end

  it "detects xbox 360" do
    @browser.ua = $ua["XBOX360"]

    assert @browser.console?
    assert @browser.xbox?
    refute @browser.xbox_one?
  end

  it "detects xbox one" do
    @browser.ua = $ua["XBOXONE"]

    assert @browser.console?
    assert @browser.xbox?
    assert @browser.xbox_one?
  end

  it "removes duplicate items" do
    @browser.ua = $ua["SAFARI"]
    assert_equal ["safari"], @browser.meta.select {|item| item == "safari" }
  end

  it "detects meta aliased as to_a" do
    @browser.ua = $ua["SAFARI"]
    assert_equal @browser.meta, @browser.to_a
  end

  it "detects bots" do
    %w[
      DOT_BOT
      FACEBOOK_BOT
      GOOGLE_BOT
      LINKDEXBOT
      LOAD_TIME_BOT
      MAIL_RU
      MSN_BOT
      SCRAPY
      YANDEX_DIRECT
      YANDEX_METRIKA
    ].each do |key|
      @browser.ua = $ua[key]
      assert @browser.bot?, "#{$ua[key]} should be a bot"
    end

    @browser.ua = $ua["CHROME"]
    refute @browser.bot?
  end

  it "doesn't consider empty UA as bot" do
    @browser.ua = ""
    refute @browser.bot?
  end

  it "allows setting empty string as bots" do
    Browser::Bots.detect_empty_ua!
    @browser.ua = ""

    assert @browser.bot?
  end

  it "doesn't detect mozilla as a bot when considering empty UA" do
    Browser::Bots.detect_empty_ua!
    @browser.ua = "Mozilla"

    refute @browser.bot?
  end

  it "returns bot name" do
    @browser.ua = $ua["GOOGLE_BOT"]
    assert_equal @browser.bot_name, "Googlebot"

    @browser.ua = $ua["FACEBOOK_BOT"]
    assert_equal @browser.bot_name, "facebookexternalhit"
  end

  it "returns bot name (empty string ua detection enabled)" do
    Browser::Bots.detect_empty_ua!
    @browser.ua = ""

    assert_equal @browser.bot_name, "Generic Bot"
  end

  it "returns nil for non-bots" do
    @browser.ua = $ua["CHROME"]
    assert_equal @browser.bot_name, nil
  end

  it "detects chrome os" do
    @browser.ua = $ua["CHROME_OS"]
    assert @browser.chrome_os?
  end

  it "detects tv" do
    @browser.ua = $ua["SMART_TV"]
    assert @browser.tv?
  end

  it "detects as search engines" do
    %w[
      ASK
      BAIDU
      BINGBOT
      DUCKDUCKGO
      GOOGLE_BOT
      YAHOO_SLURP
    ].each do |key|
      @browser.ua = $ua[key]
      assert @browser.search_engine?, "#{$ua[key]} should be a search engine"
    end
  end

  it "knows a supported browser" do
    @browser.ua = "Chrome"
    assert @browser.known?
  end

  it "does not know an unsupported browser" do
    @browser.ua = "Fancy new browser"
    refute @browser.known?
  end

  it "detects adobe air" do
    @browser.ua = $ua["ADOBE_AIR"]

    assert @browser.adobe_air?
    assert @browser.webkit?
    assert_equal @browser.version, "13"
    assert_equal @browser.full_version, "13.0"
    assert_equal @browser.name, "Other"
  end
end
