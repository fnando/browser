require "test/unit"

begin
  require "action_controller"
rescue LoadError => e
  require "rubygems"
  require "action_controller"
end

require "browser"


class BrowserTest < Test::Unit::TestCase
  IPHONE     = "Mozilla/5.0 (iPhone; U; CPU iPhone OS 3_0 like Mac OS X; en-us) AppleWebKit/420.1 (KHTML, like Gecko) Version/3.0 Mobile/1A542a Safari/419.3"
  IPOD       = "Mozilla/5.0 (iPod; U; CPU like Mac OS X; en) AppleWebKit/420.1 (KHTML, like Gecko) Version/3.0 Mobile/3A100a Safari/419.3"
  IPAD       = "Mozilla/5.0 (iPad; U; CPU OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Version/4.0.4 Mobile/7B367 Safari/531.21.10"
  SAFARI     = "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_4; en-us) AppleWebKit/533.17.8 (KHTML, like Gecko) Version/5.0.1 Safari/533.17.8"
  IE6        = "Mozilla/5.0 (Windows; U; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727)"
  IE7        = "Mozilla/5.0 (Windows; U; MSIE 7.0; Windows NT 6.0; en-US)"
  IE8        = "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.2; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0)"
  IE9        = "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)"
  OPERA      = "Opera/9.99 (Windows NT 5.1; U; pl) Presto/9.9.9"
  FIREFOX    = "Mozilla/5.0 (X11; U; Linux i686; pl-PL; rv:1.9.0.2) Gecko/20121223 Ubuntu/9.25 (jaunty) Firefox/3.8"
  CHROME     = "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_4; en-US) AppleWebKit/533.4 (KHTML, like Gecko) Chrome/5.0.375.99 Safari/533.4"
  ANDROID    = "Android SDK 1.5r3: Mozilla/5.0 (Linux; U; Android 1.5; de-; sdk Build/CUPCAKE) AppleWebkit/528.5+ (KHTML, like Gecko) Version/3.1.2 Mobile Safari/525.20.1"
  BLACKBERRY = "BlackBerry7100i/4.1.0 Profile/MIDP-2.0 Configuration/CLDC-1.1 VendorID/103"
  PSP        = "Mozilla/4.0 (PSP (PlayStation Portable); 2.00)"
  QUICKTIME  = "QuickTime/7.6.8 (qtver=7.6.8;os=Windows NT 5.1Service Pack 3)"
  COREMEDIA  = "Apple Mac OS X v10.6.4 CoreMedia v1.0.0.10F569"

  def setup
    @browser = Browser.new
  end

  def test_yield_self_when_block_is_given
    browser = nil
    Browser.new {|b| browser = b }
    assert_kind_of Browser, browser
  end

  def test_respond_to_ua_methods
    assert @browser.respond_to?(:ua)
    assert @browser.respond_to?(:ua=)
  end

  def test_delegate_ua_methods
    @browser.user_agent = "Safari"
    assert_equal "Safari", @browser.ua

    @browser.ua = "Mozilla"
    assert_equal "Mozilla", @browser.user_agent
  end

  def test_set_accept_language_while_instantiating_object
    @browser = Browser.new(:accept_language => "pt-br")
    assert_equal ["pt-br"], @browser.accept_language
  end

  def test_set_user_agent_while_instantianting_object
    @browser = Browser.new(:ua => "Safari")
    assert_equal "Safari", @browser.ua

    @browser = Browser.new(:user_agent => "Chrome")
    assert_equal "Chrome", @browser.ua
  end

  def test_detect_iphone
    @browser.ua = IPHONE

    assert_equal "iPhone", @browser.name
    assert @browser.iphone?
    assert @browser.safari?
    assert @browser.webkit?
    assert @browser.mobile?
    assert @browser.capable?
    assert @browser.ios?
    assert_equal "3.0", @browser.full_version
    assert_equal "3", @browser.version
  end

  def test_detect_safari
    @browser.ua = SAFARI

    assert_equal "Safari", @browser.name
    assert @browser.safari?
    assert @browser.webkit?
    assert @browser.capable?
    assert_equal "5.0.1", @browser.full_version
    assert_equal "5", @browser.version
  end

  def test_detect_ipod
    @browser.ua = IPOD

    assert_equal "iPod Touch", @browser.name
    assert @browser.ipod?
    assert @browser.safari?
    assert @browser.webkit?
    assert @browser.mobile?
    assert @browser.capable?
    assert @browser.ios?
    assert_equal "3.0", @browser.full_version
    assert_equal "3", @browser.version
  end

  def test_detect_ipad
    @browser.ua = IPAD

    assert_equal "iPad", @browser.name
    assert @browser.ipad?
    assert @browser.safari?
    assert @browser.webkit?
    assert @browser.capable?
    assert @browser.ios?
    assert_equal "4.0.4", @browser.full_version
    assert_equal "4", @browser.version
  end

  def test_detect_ie6
    @browser.ua = IE6

    assert_equal "Internet Explorer", @browser.name
    assert @browser.ie?
    assert @browser.ie6?
    assert @browser.capable? == false
    assert_equal "6.0", @browser.full_version
    assert_equal "6", @browser.version
  end

  def test_detect_ie7
    @browser.ua = IE7

    assert_equal "Internet Explorer", @browser.name
    assert @browser.ie?
    assert @browser.ie7?
    assert @browser.capable?
    assert_equal "7.0", @browser.full_version
    assert_equal "7", @browser.version
  end

  def test_detect_ie8
    @browser.ua = IE8

    assert_equal "Internet Explorer", @browser.name
    assert @browser.ie?
    assert @browser.ie8?
    assert @browser.capable?
    assert_equal "8.0", @browser.full_version
    assert_equal "8", @browser.version
  end

  def test_detect_ie9
    @browser.ua = IE9

    assert_equal "Internet Explorer", @browser.name
    assert @browser.ie?
    assert @browser.ie9?
    assert @browser.capable?
    assert_equal "9.0", @browser.full_version
    assert_equal "9", @browser.version
  end

  def test_detect_opera
    @browser.ua = OPERA

    assert_equal "Opera", @browser.name
    assert @browser.opera?
    assert @browser.capable?
    assert_equal "9.99", @browser.full_version
    assert_equal "9", @browser.version
  end

  def test_detect_firefox
    @browser.ua = FIREFOX

    assert_equal "Firefox", @browser.name
    assert @browser.firefox?
    assert @browser.capable?
    assert_equal "3.8", @browser.full_version
    assert_equal "3", @browser.version
  end

  def test_detect_chrome
    @browser.ua = CHROME

    assert_equal "Chrome", @browser.name
    assert @browser.chrome?
    assert !@browser.safari?
    assert @browser.webkit?
    assert @browser.capable?
    assert_equal "5.0.375.99", @browser.full_version
    assert_equal "5", @browser.version
  end

  def test_detect_android
    @browser.ua = ANDROID

    assert_equal "Android", @browser.name
    assert @browser.android?
    assert @browser.safari?
    assert @browser.webkit?
    assert @browser.mobile?
    assert @browser.capable?
    assert_equal "3.1.2", @browser.full_version
    assert_equal "3", @browser.version
  end

  def test_detect_blackberry
    @browser.ua = BLACKBERRY

    assert_equal "BlackBerry", @browser.name
    assert @browser.blackberry?
    assert @browser.mobile?
    assert @browser.capable? == false
    assert_equal "4.1.0", @browser.full_version
    assert_equal "4", @browser.version
  end

  def test_detect_quicktime
    @browser.ua = QUICKTIME

    assert_equal "QuickTime", @browser.name
    assert @browser.quicktime?
    assert_equal "7.6.8", @browser.full_version
    assert_equal "7", @browser.version
  end

  def test_detect_core_media
    @browser.ua = COREMEDIA

    assert_equal "Apple CoreMedia", @browser.name
    assert @browser.core_media?
    assert_equal "1.0.0.10F569", @browser.full_version
    assert_equal "1", @browser.version
  end

  def test_detect_psp
    @browser.ua = PSP

    assert_equal "PlayStation Portable", @browser.name
    assert @browser.psp?
    assert @browser.mobile?
  end

  def test_detect_other_mobiles
    @browser.ua = "Symbian OS"
    assert @browser.mobile?

    @browser.ua = "MIDP-2.0"
    assert @browser.mobile?

    @browser.ua = "Windows CE"
    assert @browser.mobile?
  end

  def test_return_a_zero_version
    @browser.ua = "Bot"
    assert_equal "0.0", @browser.full_version
    assert_equal "0", @browser.version
  end

  def test_meta
    @browser.ua = CHROME
    assert_kind_of Array, @browser.meta
  end

  def test_return_string_representation
    @browser.ua = CHROME
    assert_equal "chrome webkit mac capable", @browser.to_s
  end

  def test_return_string_representation_for_ios
    @browser.ua = IPHONE
    assert_equal "iphone webkit ios safari safari3 mac capable mobile", @browser.to_s
  end

  def test_return_string_representation_for_mobile
    @browser.ua = BLACKBERRY
    assert_equal "blackberry blackberry4 other mobile", @browser.to_s
  end

  def test_return_string_representation_for_handcap
    @browser.ua = IE6
    assert_equal "ie ie6 windows", @browser.to_s
  end

  def test_detect_unknown_id
    @browser.ua = "Unknown"
    assert_equal :other, @browser.id
  end

  def test_detect_unknown_name
    @browser.ua = "Unknown"
    assert_equal "Other", @browser.name
  end

  def test_detect_mac_platform
    @browser.ua = "Mac OS X"
    assert_equal :mac, @browser.platform
  end

  def test_detect_windows_platform
    @browser.ua = "Windows"
    assert_equal :windows, @browser.platform
  end

  def test_detect_linux_platform
    @browser.ua = "Linux"
    assert_equal :linux, @browser.platform
  end

  def test_detect_unknown_platform
    @browser.ua = "Unknown"
    assert_equal :other, @browser.platform
  end

  def test_return_all_known_languages
    @browser.accept_language = "en-us,en;q=0.8,pt-br;q=0.5,pt;q=0.3"
    assert_equal ["en-us", "en", "pt-br", "pt"], @browser.accept_language
  end

  def test_pimp_action_controller
    methods = ActionController::Base.private_instance_methods.collect {|m| m.to_sym}
    assert methods.include?(:browser)
  end
end
