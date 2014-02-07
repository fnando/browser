# -*- encoding: utf-8 -*-
require "test_helper"

class BrowserTest < Test::Unit::TestCase
  IPHONE                = "Mozilla/5.0 (iPhone; U; CPU iPhone OS 3_0 like Mac OS X; en-us) AppleWebKit/420.1 (KHTML, like Gecko) Version/3.0 Mobile/1A542a Safari/419.3"
  IPOD                  = "Mozilla/5.0 (iPod; U; CPU like Mac OS X; en) AppleWebKit/420.1 (KHTML, like Gecko) Version/3.0 Mobile/3A100a Safari/419.3"
  IPAD                  = "Mozilla/5.0 (iPad; U; CPU OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Version/4.0.4 Mobile/7B367 Safari/531.21.10"
  SAFARI                = "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_4; en-us) AppleWebKit/533.17.8 (KHTML, like Gecko) Version/5.0.1 Safari/533.17.8"
  IE6                   = "Mozilla/5.0 (Windows; U; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727)"
  IE7                   = "Mozilla/5.0 (Windows; U; MSIE 7.0; Windows NT 6.0; en-US)"
  IE8                   = "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.2; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0)"
  IE8_COMPAT            = "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; Trident/4.0; SLCC1; Media Center PC 5.0; .NET CLR 3.5.21022)"
  IE9                   = "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)"
  IE9_COMPAT            = "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; Trident/5.0)"
  IE10                  = "Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; Trident/6.0; EIE10;ENUSMSN)"
  IE10_COMPAT           = "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.1; Trident/6.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; EIE10;ENUSMSN)"
  IE10_X64_WINX64       = "Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Win64; x64; Trident/6.0)"
  IE11                  = "Mozilla/5.0 (Windows NT 6.1; Trident/7.0; rv:11.0) like Gecko"
  IE11_TOUCH_SCREEN     = "Mozilla/5.0 (Windows NT 6.3; Win64; x64; Trident/7.0; Touch; rv:11.0) like Gecko"
  OPERA                 = "Opera/9.80 (Macintosh; Intel Mac OS X 10.7.4; U; en) Presto/2.10.229 Version/11.64"
  OPERA_NEXT            = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.37 Safari/537.36 OPR/15.0.1147.44 (Edition Next)"
  FIREFOX               = "Mozilla/5.0 (X11; U; Linux i686; pl-PL; rv:1.9.0.2) Gecko/20121223 Ubuntu/9.25 (jaunty) Firefox/3.8"
  FIREFOX_MODERN        = "Mozilla/5.0 (X11; Ubuntu; Linux armv7l; rv:17.0) Gecko/20100101 Firefox/17.0"
  FIREFOX_TABLET        = "Mozilla/5.0 (Android; Tablet; rv:14.0) Gecko/14.0 Firefox/14.0"
  CHROME                = "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_4; en-US) AppleWebKit/533.4 (KHTML, like Gecko) Chrome/5.0.375.99 Safari/533.4"
  MOBILE_CHROME         = "Mozilla/5.0 (iPhone; U; CPU iPhone OS 5_1_1 like Mac OS X; en) AppleWebKit/534.46.0 (KHTML, like Gecko) CriOS/19.0.1084.60 Mobile/9B206 Safari/7534.48.3"
  CHROME_OS             = "Mozilla/5.0 (X11; CrOS x86_64 3701.81.0) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.57 Safari/537.31."
  ANDROID               = "Android SDK 1.5r3: Mozilla/5.0 (Linux; U; Android 1.5; de-; sdk Build/CUPCAKE) AppleWebkit/528.5+ (KHTML, like Gecko) Version/3.1.2 Mobile Safari/525.20.1"
  TABLOID               = "Mozilla/5.0 (Linux; U; Android 3.0; en-us; Xoom Build/HRI39) AppleWebKit/534.13 (KHTML, like Gecko) Version/4.0 Safari/534.13"
  BLACKBERRY            = "BlackBerry7100i/4.1.0 Profile/MIDP-2.0 Configuration/CLDC-1.1 VendorID/103"
  BLACKBERRY4           = "BlackBerry8100/4.2.1 Profile/MIDP-2.0 Configuration/CLDC-1.1 VendorID/103"
  BLACKBERRY5           = "BlackBerry9000/5.0.0.93 Profile/MIDP-2.0 Configuration/CLDC-1.1 VendorID/179"
  BLACKBERRY6           = "Mozilla/5.0 (BlackBerry; U; BlackBerry AAAA; en-US) AppleWebKit/534.11+ (KHTML, like Gecko) Version/6.0.0.141 Mobile Safari/534.11+"
  BLACKBERRY7           = "Mozilla/5.0 (BlackBerry; U; BlackBerry AAAA; en-US) AppleWebKit/534.11+ (KHTML, like Gecko) Version/7.0.0.1 Mobile Safari/534.11+"
  BLACKBERRY10          = "Mozilla/5.0 (BB10; Touch) AppleWebKit/537.10+ (KHTML, like Gecko) Version/10.0.9.1675 Mobile Safari/537.10+"
  PSP                   = "Mozilla/4.0 (PSP (PlayStation Portable); 2.00)"
  PSP_VITA              = "Mozilla/5.0 (Playstation Vita 1.61) AppleWebKit/531.22.8 (KHTML, like Gecko) Silk/3.2"
  QUICKTIME             = "QuickTime/7.6.8 (qtver=7.6.8;os=Windows NT 5.1Service Pack 3)"
  COREMEDIA             = "Apple Mac OS X v10.6.4 CoreMedia v1.0.0.10F569"
  XOOM                  = "Mozilla/5.0 (Linux; U; Android 3.0; en-us; Xoom Build/HRI39) AppleWebKit/534.13 (KHTML, like Gecko) Version/4.0 Safari/534.13"
  NEXUS_TABLET          = "Mozilla/5.0 (Linux; Android 4.1.1; Nexus 7 Build/JRO03D) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.166 Safari/535.19"
  NOOK                  = "Mozilla/5.0 (Linux; U; Android 2.3.4; en-us; NOOK BNTV250A Build/GINGERBREAD 1.4.3) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Safari/533.1"
  SAMSUNG               = "Mozilla/5.0 (Linux; U; Android 4.0.4; en-us; SAMSUNG-SGH-I497 Build/IMM76D) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Safari/534.30"
  OPERA_MINI            = "Opera/9.80 (Android; Opera Mini/7.029952/28.2359;u; fr) Presto/2.8.119 Version/11.10"
  OPERA_MOBI            = "Opera/9.8 (Android 2.3.5; Linux; Opera Mobi/ADR-1205181138; U; en) Presto/2.10.254 Version/12.00"
  WINDOWS_PHONE         = "Mozilla/4.0 (compatible; MSIE 7.0; Windows Phone OS 7.0; Trident/3.1; IEMobile/7.0; DELL; Venue Pro)"
  WINDOWS_PHONE8        = "Mozilla/5.0 (compatible; MSIE 10.0; Windows Phone 8.0; Trident/6.0; IEMobile/10.0; ARM; Touch; NOKIA; Lumia 920)"
  WINDOWS_MOBILE        = "Mozilla/4.0 (compatible; MSIE 6.0; Windows CE; IEMobile 6.12)"
  WINDOWS8              = "Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0)"
  WINDOWS81             = "Mozilla/5.0 (IE 11.0; Windows NT 6.3; Trident/7.0; .NET4.0E; .NET4.0C; rv:11.0) like Gecko"
  SURFACE               = "Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; ARM; Trident/6.0; Touch)"
  KINDLE                = "Mozilla/5.0 (Linux; U; en-US) AppleWebKit/528.5+ (KHTML, like Gecko, Safari/528.5+) Version/4.0 Kindle/3.0 (screen 600×800; rotate)"
  KINDLE_FIRE           = "Mozilla/5.0 (Linux; U; Android 2.3.4; en-us; Kindle Fire Build/GINGERBREAD) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1"
  KINDLE_FIRE_HD        = "Mozilla/5.0 (Linux; U; en-us; KFTT Build/IML74K) AppleWebKit/535.19 (KHTML, like Gecko) Silk/3.4 Safari/535.19 Silk-Accelerated=true"
  KINDLE_FIRE_HD_MOBILE = "Mozilla/5.0 (Linux; U; Android 4.0.3; en-us; KFTT Build/IML74K) AppleWebKit/535.19 (KHTML, like Gecko) Silk/3.4 Mobile Safari/535.19 Silk-Accelerated=true"
  PHANTOM_JS            = "Mozilla/5.0 (Macintosh; Intel Mac OS X) AppleWebKit/534.34 (KHTML, like Gecko) PhantomJS/1.9.0 Safari/534.34"
  IOS4                  = "Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_0 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Version/4.0.5 Mobile/8A293 Safari/6531.22.7"
  IOS5                  = "Mozilla/5.0 (iPhone; CPU iPhone OS 5_0 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 Mobile/9A334 Safari/7534.48.3"
  IOS6                  = "Mozilla/5.0 (iPhone; CPU iPhone OS 6_0 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10A5376e Safari/8536.25"
  IOS7                  = "Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465 Safari/9537.53"
  PLAYBOOK              = "Mozilla/5.0 (PlayBook; U; RIM Tablet OS 2.1.0; en-US) AppleWebKit/536.2+ (KHTML, like Gecko) Version/7.2.1.0 Safari/536.2+"
  NINTENDO_WII          = "Opera/9.00 (Nintendo Wii; U; ; 1309-9; en)"
  NINTENDO_WIIU         = "Mozilla/5.0 (Nintendo WiiU) AppleWebKit/534.52 (KHTML, like Gecko) NX/2.1.0.8.23 NintendoBrowser/1.1.0.7579.EU"
  PLAYSTATION3          = "Mozilla/5.0 (PLAYSTATION 3; 3.55)"
  PLAYSTATION4          = "Mozilla/5.0 (PlayStation 4 1.020) AppleWebKit/536.26 (KHTML, like Gecko)"
  XBOX360               = "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0; Xbox), or Mozilla/5.0 (compatible; MSIE 9.0; Windows Phone OS 7.5; Trident/5.0; IEMobile/9.0; Xbox)"
  XBOXONE               = "Mozilla/5.0 (Compatible; MSIE 10.0; Windows NT 6.2; Trident /6.0; Xbox; Xbox One)"
  GOOGLE_BOT            = "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)"
  MSN_BOT               = "msnbot-media/1.1 (+http://search.msn.com/msnbot.htm)"
  FACEBOOK_BOT          = "facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)"
  SMART_TV              = "Mozilla/5.0 (SmartHub; SMART-TV; U; Linux/SmartTV) AppleWebKit/531.2+ (KHTML, like Gecko) WebBrowser/1.0 SmartTV Safari/531.2+"

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
    assert @browser.modern?
    assert @browser.ios?
    assert ! @browser.tablet?
    assert_equal "3.0", @browser.full_version
    assert_equal "3", @browser.version
  end

  def test_detect_safari
    @browser.ua = SAFARI

    assert_equal "Safari", @browser.name
    assert @browser.safari?
    assert @browser.webkit?
    assert @browser.modern?
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
    assert @browser.modern?
    assert @browser.ios?
    assert ! @browser.tablet?
    assert_equal "3.0", @browser.full_version
    assert_equal "3", @browser.version
  end

  def test_detect_ipad
    @browser.ua = IPAD

    assert_equal "iPad", @browser.name
    assert @browser.ipad?
    assert @browser.safari?
    assert @browser.webkit?
    assert @browser.modern?
    assert @browser.ios?
    assert @browser.tablet?
    assert ! @browser.mobile?
    assert_equal "4.0.4", @browser.full_version
    assert_equal "4", @browser.version
  end

  def test_detect_ios4
    @browser.ua = IOS4
    assert @browser.ios?
    assert @browser.ios4?
  end


  def test_detect_ios5
    @browser.ua = IOS5
    assert @browser.ios?
    assert @browser.ios5?
  end

  def test_detect_ios6
    @browser.ua = IOS6
    assert @browser.ios?
    assert @browser.ios6?
  end

  def test_detect_ios7
    @browser.ua = IOS7
    assert @browser.ios?
    assert @browser.ios7?
  end

  def test_detect_ie6
    @browser.ua = IE6

    assert_equal "Internet Explorer", @browser.name
    assert @browser.ie?
    assert @browser.ie6?
    assert ! @browser.modern?
    assert_equal "6.0", @browser.full_version
    assert_equal "6", @browser.version
  end

  def test_detect_ie7
    @browser.ua = IE7

    assert_equal "Internet Explorer", @browser.name
    assert @browser.ie?
    assert @browser.ie7?
    assert ! @browser.modern?
    assert_equal "7.0", @browser.full_version
    assert_equal "7", @browser.version
  end

  def test_detect_ie8
    @browser.ua = IE8

    assert_equal "Internet Explorer", @browser.name
    assert @browser.ie?
    assert @browser.ie8?
    assert ! @browser.modern?
    assert ! @browser.compatibility_view?
    assert_equal "8.0", @browser.full_version
    assert_equal "8", @browser.version
  end

  def test_detect_ie8_in_compatibility_view
    @browser.ua = IE8_COMPAT

    assert_equal "Internet Explorer", @browser.name
    assert @browser.ie?
    assert @browser.ie7?
    assert ! @browser.ie8?
    assert ! @browser.modern?
    assert @browser.compatibility_view?
    assert_equal "7.0", @browser.full_version
    assert_equal "7", @browser.version
  end

  def test_detect_ie9
    @browser.ua = IE9

    assert_equal "Internet Explorer", @browser.name
    assert @browser.ie?
    assert @browser.ie9?
    assert @browser.modern?
    assert ! @browser.compatibility_view?
    assert_equal "9.0", @browser.full_version
    assert_equal "9", @browser.version
  end

  def test_detect_ie9_in_compatibility_view
    @browser.ua = IE9_COMPAT

    assert_equal "Internet Explorer", @browser.name
    assert @browser.ie?
    assert @browser.ie7?
    assert ! @browser.ie9?
    assert ! @browser.modern?
    assert @browser.compatibility_view?
    assert_equal "7.0", @browser.full_version
    assert_equal "7", @browser.version
  end

  def test_detect_ie10
    @browser.ua = IE10

    assert_equal "Internet Explorer", @browser.name
    assert @browser.ie?
    assert @browser.ie10?
    assert @browser.modern?
    assert ! @browser.compatibility_view?
    assert_equal "10.0", @browser.full_version
    assert_equal "10", @browser.version
  end

  def test_detect_ie10_in_compatibility_view
    @browser.ua = IE10_COMPAT

    assert_equal "Internet Explorer", @browser.name
    assert @browser.ie?
    assert @browser.ie7?
    assert ! @browser.ie10?
    assert ! @browser.modern?
    assert @browser.compatibility_view?
    assert_equal "7.0", @browser.full_version
    assert_equal "7", @browser.version
  end

  def test_detect_ie11
    @browser.ua = IE11

    assert_equal "Internet Explorer", @browser.name
    assert @browser.ie?
    assert @browser.ie11?
    assert @browser.modern?
    assert ! @browser.compatibility_view?
    assert_equal "11.0", @browser.full_version
    assert_equal "11", @browser.version
  end

  def test_detect_opera
    @browser.ua = OPERA

    assert_equal "Opera", @browser.name
    assert @browser.opera?
    assert ! @browser.modern?
    assert_equal "11.64", @browser.full_version
    assert_equal "11", @browser.version
  end

  def test_detect_opera_next
    @browser.ua = OPERA_NEXT

    assert_equal "Opera", @browser.name
    assert_equal :opera, @browser.id
    assert @browser.opera?
    assert @browser.webkit?
    assert @browser.modern?
    assert ! @browser.chrome?
    assert_equal "28.0.1500.37", @browser.full_version
    assert_equal "28", @browser.version
  end

  def test_detect_firefox
    @browser.ua = FIREFOX

    assert_equal "Firefox", @browser.name
    assert @browser.firefox?
    assert ! @browser.modern?
    assert_equal "3.8", @browser.full_version
    assert_equal "3", @browser.version
  end

  def test_detect_modern_firefox
    @browser.ua = FIREFOX_MODERN

    assert_equal "Firefox", @browser.name
    assert @browser.firefox?
    assert @browser.modern?
    assert_equal "17.0", @browser.full_version
    assert_equal "17", @browser.version
  end

  def test_detect_firefox_android_tablet
    @browser.ua = FIREFOX_TABLET

    assert_equal "Android", @browser.name
    assert @browser.firefox?
    assert @browser.modern?
    assert @browser.tablet?
    assert @browser.android?
    assert_equal "14.0", @browser.full_version
    assert_equal "14", @browser.version
  end

  def test_detect_chrome
    @browser.ua = CHROME

    assert_equal "Chrome", @browser.name
    assert @browser.chrome?
    assert ! @browser.safari?
    assert @browser.webkit?
    assert @browser.modern?
    assert_equal "5.0.375.99", @browser.full_version
    assert_equal "5", @browser.version
  end

  def test_detect_mobile_chrome
    @browser.ua = MOBILE_CHROME

    assert_equal "Chrome", @browser.name
    assert @browser.chrome?
    assert ! @browser.safari?
    assert @browser.webkit?
    assert @browser.modern?
    assert_equal "19.0.1084.60", @browser.full_version
    assert_equal "19", @browser.version
  end

  def test_detect_android
    @browser.ua = ANDROID

    assert_equal "Android", @browser.name
    assert @browser.android?
    assert @browser.safari?
    assert @browser.webkit?
    assert @browser.mobile?
    assert ! @browser.tablet?
    assert @browser.modern?
    assert_equal "3.1.2", @browser.full_version
    assert_equal "3", @browser.version
  end

  def test_detect_android_tablet
    @browser.ua = TABLOID

    assert_equal "Android", @browser.name
    assert @browser.android?
    assert @browser.safari?
    assert @browser.webkit?
    assert ! @browser.mobile?
    assert @browser.tablet?
    assert @browser.modern?
    assert_equal "4.0", @browser.full_version
    assert_equal "4", @browser.version
  end

  def test_detect_surface_tablet
    @browser.ua = SURFACE

    assert_equal "Internet Explorer", @browser.name
    assert @browser.surface?
    assert @browser.ie?
    assert ! @browser.mobile?
    assert @browser.tablet?
    assert @browser.modern?
    assert_equal "10.0", @browser.full_version
    assert_equal "10", @browser.version
  end

  def test_detect_blackberry
    @browser.ua = BLACKBERRY

    assert_equal "BlackBerry", @browser.name
    assert @browser.blackberry?
    assert ! @browser.tablet?
    assert @browser.mobile?
    assert ! @browser.modern?
    assert_equal "4.1.0", @browser.full_version
    assert_equal "4", @browser.version
  end

  def test_detect_blackberry4
    @browser.ua = BLACKBERRY4

    assert_equal "BlackBerry", @browser.name
    assert @browser.blackberry4?
    assert ! @browser.tablet?
    assert @browser.mobile?
    assert ! @browser.modern?
    assert_equal "4.2.1", @browser.full_version
    assert_equal "4", @browser.version
  end

  def test_detect_blackberry5
    @browser.ua = BLACKBERRY5

    assert_equal "BlackBerry", @browser.name
    assert @browser.blackberry5?
    assert ! @browser.tablet?
    assert @browser.mobile?
    assert ! @browser.modern?
    assert_equal "5.0.0.93", @browser.full_version
    assert_equal "5", @browser.version
  end

  def test_detect_blackberry6
    @browser.ua = BLACKBERRY6

    assert_equal "BlackBerry", @browser.name
    assert @browser.blackberry6?
    assert ! @browser.tablet?
    assert @browser.mobile?
    assert @browser.modern?
    assert_equal "534.11", @browser.full_version
    assert_equal "534", @browser.version
  end

  def test_detect_blackberry7
    @browser.ua = BLACKBERRY7

    assert_equal "BlackBerry", @browser.name
    assert @browser.blackberry7?
    assert ! @browser.tablet?
    assert @browser.mobile?
    assert @browser.modern?
    assert_equal "534.11", @browser.full_version
    assert_equal "534", @browser.version
  end

  def test_detect_blackberry10
    @browser.ua = BLACKBERRY10

    assert_equal "Safari", @browser.name
    assert @browser.blackberry10?
    assert ! @browser.tablet?
    assert @browser.mobile?
    assert @browser.modern?
    assert_equal "10.0.9.1675", @browser.full_version
    assert_equal "10", @browser.version
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

  def test_detect_phantom_js
    @browser.ua = PHANTOM_JS

    assert_equal "PhantomJS", @browser.name
    assert @browser.phantom_js?
    assert ! @browser.tablet?
    assert ! @browser.mobile?
    assert @browser.modern?
    assert_equal "1.9.0", @browser.full_version
    assert_equal "1", @browser.version
  end

  def test_detect_psp
    @browser.ua = PSP

    assert_equal "PlayStation Portable", @browser.name
    assert @browser.psp?
    assert @browser.mobile?
  end

  def test_detect_psp_vita
    @browser.ua = PSP_VITA

    assert_equal "PlayStation Portable", @browser.name
    assert @browser.psp?
    assert @browser.mobile?
  end

  def test_detect_other_mobiles
    @browser.ua = "Symbian OS"
    assert @browser.mobile?
    assert ! @browser.tablet?

    @browser.ua = "MIDP-2.0"
    assert @browser.mobile?
    assert ! @browser.tablet?
  end

  def test_detect_windows_mobile
    @browser.ua = WINDOWS_MOBILE

    assert @browser.mobile?
    assert @browser.windows?
    assert @browser.windows_mobile?
    assert ! @browser.windows_phone?
    assert ! @browser.tablet?
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
    meta = @browser.to_s

    assert meta.include?("chrome")
    assert meta.include?("webkit")
    assert meta.include?("mac")
    assert meta.include?("modern")
  end

  def test_return_string_representation_for_ios
    @browser.ua = IPHONE
    meta = @browser.to_s

    assert meta.include?("iphone")
    assert meta.include?("webkit")
    assert meta.include?("ios")
    assert meta.include?("safari")
    assert meta.include?("safari3")
    assert meta.include?("mac")
    assert meta.include?("modern")
    assert meta.include?("mobile")
  end

  def test_return_string_representation_for_mobile
    @browser.ua = BLACKBERRY
    meta = @browser.to_s

    assert meta.include?("blackberry")
    assert meta.include?("blackberry4")
    assert meta.include?("other")
    assert meta.include?("mobile")
  end

  def test_return_string_representation_for_ie6
    @browser.ua = IE6
    meta = @browser.meta

    assert meta.include?("ie")
    assert meta.include?("ie6")
    assert meta.include?("oldie")
    assert meta.include?("lt-ie8")
    assert meta.include?("lt-ie9")
    assert meta.include?("windows")
  end

  def test_return_string_representation_for_ie7
    @browser.ua = IE7
    meta = @browser.meta

    assert meta.include?("ie")
    assert meta.include?("ie7")
    assert meta.include?("oldie")
    assert meta.include?("lt-ie8")
    assert meta.include?("lt-ie9")
    assert meta.include?("windows")
  end

  def test_return_string_representation_for_ie8
    @browser.ua = IE8
    meta = @browser.meta

    assert meta.include?("ie")
    assert meta.include?("ie8")
    assert meta.include?("lt-ie9")
    assert meta.include?("windows")
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
    assert @browser.mac?
  end

  def test_detect_windows_platform
    @browser.ua = "Windows"
    assert_equal :windows, @browser.platform
    assert @browser.windows?
  end

  def test_detect_windows8
    @browser.ua = WINDOWS8

    assert @browser.windows?
    assert @browser.windows8?
  end

  def test_detect_windows8_1
    @browser.ua = WINDOWS81

    assert @browser.windows?
    assert @browser.windows8?
  end

  def test_detect_linux_platform
    @browser.ua = "Linux"
    assert_equal :linux, @browser.platform
    assert @browser.linux?
  end

  def test_detect_unknown_platform
    @browser.ua = "Unknown"
    assert_equal :other, @browser.platform
  end

  def test_return_all_known_languages
    @browser.accept_language = "en-us,en;q=0.8,pt-br;q=0.5,pt;q=0.3"
    assert_equal ["en-us", "en", "pt-br", "pt"], @browser.accept_language
  end

  def test_xoom
    @browser.ua = XOOM

    assert @browser.android?
    assert @browser.tablet?
    assert ! @browser.mobile?
  end

  def test_nexus_tablet
    @browser.ua = NEXUS_TABLET

    assert @browser.android?
    assert @browser.tablet?
    assert ! @browser.mobile?
  end

  def test_blackberry_playbook_tablet
    @browser.ua = PLAYBOOK

    assert ! @browser.android?
    assert @browser.tablet?
    assert ! @browser.mobile?

    assert_equal "7.2.1.0", @browser.full_version
    assert_equal "7", @browser.version
  end

  def test_opera_mini
    @browser.ua = OPERA_MINI

    assert @browser.opera_mini?
    assert ! @browser.tablet?
    assert @browser.mobile?
  end

  def test_opera_mobi
    @browser.ua = OPERA_MOBI

    assert @browser.opera?
    assert ! @browser.tablet?
    assert @browser.mobile?
  end

  def test_windows_phone
    @browser.ua = WINDOWS_PHONE

    assert @browser.ie?
    assert_equal "7", @browser.version
    assert @browser.mobile?
    assert @browser.windows_phone?
    assert ! @browser.windows_mobile?
    assert ! @browser.tablet?
  end

  def test_windows_phone_8
    @browser.ua = WINDOWS_PHONE8

    assert @browser.ie?
    assert_equal "10", @browser.version
    assert @browser.mobile?
    assert @browser.windows_phone?
    assert ! @browser.windows_mobile?
    assert ! @browser.tablet?
  end

  def test_windows_mobile
    @browser.ua = WINDOWS_PHONE8

    assert @browser.ie?
    assert_equal "10", @browser.version
    assert @browser.mobile?
    assert @browser.windows_phone?
    assert ! @browser.windows_mobile?
    assert ! @browser.tablet?
  end

  def test_windows_x64
    @browser.ua = IE10_X64_WINX64
    assert @browser.windows_x64?
  end

  def test_detect_ie11_touch_desktop_pc
    @browser.ua = IE11_TOUCH_SCREEN

    assert_equal "Internet Explorer", @browser.name
    assert @browser.ie?
    assert @browser.ie11?
    assert @browser.modern?
    assert ! @browser.compatibility_view?
    assert ! @browser.windows_rt?
    assert @browser.windows_touchscreen_desktop?
    assert @browser.windows8?
    assert_equal "11.0", @browser.full_version
    assert_equal "11", @browser.version
  end

  def test_kindle_monochrome
    @browser.ua = KINDLE

    assert @browser.kindle?
    assert @browser.webkit?
  end

  def test_kindle_fire
    @browser.ua = KINDLE_FIRE

    assert @browser.kindle?
    assert @browser.webkit?
  end

  def test_kindle_fire_hd
    @browser.ua = KINDLE_FIRE_HD

    assert @browser.silk?
    assert @browser.kindle?
    assert @browser.webkit?
    assert @browser.modern?
    assert ! @browser.mobile?
  end

  def test_kindle_fire_hd_mobile
    @browser.ua = KINDLE_FIRE_HD_MOBILE

    assert @browser.silk?
    assert @browser.kindle?
    assert @browser.webkit?
    assert @browser.modern?
    assert @browser.mobile?
  end

  def test_nook
    @browser.ua = NOOK

    assert @browser.tablet?
    assert ! @browser.mobile?
  end

  def test_samsung
    @browser.ua = SAMSUNG

    assert @browser.tablet?
    assert ! @browser.mobile?
  end

  def test_nintendo_wii
    @browser.ua = NINTENDO_WII

    assert @browser.console?
    assert @browser.nintendo?
  end

  def test_nintendo_wii_u
    @browser.ua = NINTENDO_WIIU

    assert @browser.console?
    assert @browser.nintendo?
  end

  def test_playstation_3
    @browser.ua = PLAYSTATION3

    assert @browser.console?
    assert @browser.playstation?
  end

  def test_playstation_4
    @browser.ua = PLAYSTATION4

    assert @browser.console?
    assert @browser.playstation?
  end

  def test_xbox_360
    @browser.ua = XBOX360

    assert @browser.console?
    assert @browser.xbox?
  end

  def test_xbox_one
    @browser.ua = XBOXONE

    assert @browser.console?
    assert @browser.xbox?
  end

  def test_remove_duplicate_items
    @browser.ua = SAFARI
    assert_equal ["safari"], @browser.meta.select {|item| item == "safari" }
  end

  def test_meta_aliased_as_to_a
    @browser.ua = SAFARI
    assert_equal @browser.meta, @browser.to_a
  end

  def test_bots
    @browser.ua = GOOGLE_BOT
    assert @browser.bot?

    @browser.ua = MSN_BOT
    assert @browser.bot?

    @browser.ua = FACEBOOK_BOT
    assert @browser.bot?

    # Many bots actually report empty ua strings.
    @browser.ua = ''
    assert @browser.bot?

    @browser.ua = CHROME
    assert ! @browser.bot?
  end

  def test_chrome_os
    @browser.ua = CHROME_OS
    assert @browser.chrome_os?
  end

  def test_tv
    @browser.ua = SMART_TV
    assert @browser.tv?
  end
end
