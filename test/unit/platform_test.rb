# frozen_string_literal: true

require "test_helper"

class PlatformTest < Minitest::Test
  class CustomPlatform < Browser::Platform::Base
    def match?
      browser.ua =~ /Custom/
    end

    def id
      :custom
    end
  end

  test "extend matchers" do
    Browser::Platform.matchers.unshift(CustomPlatform)
    browser = Browser.new("Custom")
    assert_equal :custom, browser.platform.id

    Browser::Platform.matchers.shift
    browser = Browser.new("Custom")
    assert_equal :other, browser.platform.id
  end

  test "implements to_s" do
    browser = Browser.new(Browser["IOS9"])
    assert_equal "ios", browser.platform.to_s
  end

  test "implements ==" do
    browser = Browser.new(Browser["IOS9"])

    assert browser.platform == :ios
    refute browser.platform == :android
  end

  test "detect other" do
    browser = Browser.new("Other")

    assert_equal "Other", browser.platform.name
    assert_equal :other, browser.platform.id
    assert_equal "0", browser.platform.version
    assert browser.platform.other?
  end

  test "detect ios (iPhone)" do
    browser = Browser.new(Browser["IOS4"])

    assert_equal "iOS (iPhone)", browser.platform.name
    assert_equal :ios, browser.platform.id
    assert browser.platform.ios?
    assert_equal "4", browser.platform.version
  end

  test "detect ios (iPad)" do
    browser = Browser.new(Browser["IOS9"])

    assert_equal "iOS (iPad)", browser.platform.name
    assert_equal :ios, browser.platform.id
    assert browser.platform.ios?
    assert_equal "9", browser.platform.version
  end

  test "detect ios (iPod Touch)" do
    browser = Browser.new(Browser["IPOD"])

    assert_equal "iOS (iPod)", browser.platform.name
    assert_equal :ios, browser.platform.id
    assert browser.platform.ios?
    assert_equal "0", browser.platform.version
  end

  test "detect linux" do
    browser = Browser.new(Browser["FIREFOX"])

    assert_equal "Generic Linux", browser.platform.name
    assert_equal :linux, browser.platform.id
    assert browser.platform.linux?
    assert_equal "0", browser.platform.version
  end

  test "detect mac" do
    browser = Browser.new(Browser["SAFARI"])

    assert_equal "Macintosh", browser.platform.name
    assert_equal :mac, browser.platform.id
    assert browser.platform.mac?
    assert_equal "10.6.4", browser.platform.version
    assert browser.platform.mac?(["=10.6.4"])
  end

  test "return stub version for Mac user agent without version" do
    browser = Browser.new("Macintosh")
    assert_equal "0", browser.platform.version
  end

  test "detect firefox os" do
    browser = Browser.new(Browser["FIREFOX_OS"])

    assert_equal "Firefox OS", browser.platform.name
    assert_equal :firefox_os, browser.platform.id
    assert browser.platform.firefox_os?
    assert_equal "0", browser.platform.version
  end

  test "detect windows phone" do
    browser = Browser.new(Browser["MS_EDGE_MOBILE"])

    assert_equal "Windows Phone", browser.platform.name
    assert_equal :windows_phone, browser.platform.id
    assert browser.platform.windows_phone?
    assert_equal "10.0", browser.platform.version
  end

  test "detect windows mobile" do
    browser = Browser.new(Browser["WINDOWS_MOBILE"])

    assert_equal "Windows Mobile", browser.platform.name
    assert_equal :windows_mobile, browser.platform.id
    assert browser.platform.windows_mobile?
    assert_equal "0", browser.platform.version
  end

  test "detect blackberry 10" do
    browser = Browser.new(Browser["BLACKBERRY10"])

    assert_equal "BlackBerry", browser.platform.name
    assert_equal :blackberry, browser.platform.id
    assert browser.platform.blackberry?
    assert_equal "10.0.9.1675", browser.platform.version
  end

  test "detect blackberry 4" do
    browser = Browser.new(Browser["BLACKBERRY4"])

    assert_equal "BlackBerry", browser.platform.name
    assert_equal :blackberry, browser.platform.id
    assert browser.platform.blackberry?
    assert_equal "4.2.1", browser.platform.version
  end

  test "detect blackberry 4 (other)" do
    browser = Browser.new(Browser["BLACKBERRY"])

    assert_equal "BlackBerry", browser.platform.name
    assert_equal :blackberry, browser.platform.id
    assert browser.platform.blackberry?
    assert_equal "4.1.0", browser.platform.version
  end

  test "detect blackberry 5" do
    browser = Browser.new(Browser["BLACKBERRY5"])

    assert_equal "BlackBerry", browser.platform.name
    assert_equal :blackberry, browser.platform.id
    assert browser.platform.blackberry?
    assert_equal "5.0.0.93", browser.platform.version
  end

  test "detect blackberry 6" do
    browser = Browser.new(Browser["BLACKBERRY6"])

    assert_equal "BlackBerry", browser.platform.name
    assert_equal :blackberry, browser.platform.id
    assert browser.platform.blackberry?
    assert_equal "6.0.0.141", browser.platform.version
  end

  test "detect blackberry 7" do
    browser = Browser.new(Browser["BLACKBERRY7"])

    assert_equal "BlackBerry", browser.platform.name
    assert_equal :blackberry, browser.platform.id
    assert browser.platform.blackberry?
    assert_equal "7.0.0.1", browser.platform.version
  end

  test "detect android" do
    browser = Browser.new(Browser["ANDROID_CUPCAKE"])

    assert_equal "Android", browser.platform.name
    assert_equal :android, browser.platform.id
    assert browser.platform.android?
    assert_equal "1.5", browser.platform.version
  end

  test "detect chrome os" do
    browser = Browser.new(Browser["CHROME_OS"])

    assert_equal "Chrome OS", browser.platform.name
    assert_equal :chrome_os, browser.platform.id
    assert browser.platform.chrome_os?
    assert browser.platform.chrome_os?(%w[>=3701 <3702])
    assert_equal "3701.81.0", browser.platform.version
  end

  test "detect adobe air" do
    browser = Browser.new(Browser["ADOBE_AIR"])

    assert browser.platform.adobe_air?
    assert browser.platform.adobe_air?(%w[>=13 <14])
  end
end
