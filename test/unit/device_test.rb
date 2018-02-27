# frozen_string_literal: true

require "test_helper"

class DeviceTest < Minitest::Test
  class CustomDevice < Browser::Device::Base
    def match?
      browser.ua =~ /Custom/
    end

    def id
      :custom
    end
  end

  test "extends matchers" do
    Browser::Device.matchers.unshift(CustomDevice)
    browser = Browser.new("Custom")
    assert_equal :custom, browser.device.id

    Browser::Device.matchers.shift
    browser = Browser.new("Custom")
    assert_equal :unknown, browser.device.id
  end

  test "detects generic device" do
    browser = Browser.new("")

    assert browser.device.unknown?
    assert_equal :unknown, browser.device.id
  end

  test "detects ipad" do
    browser = Browser.new(Browser["IOS9"])
    assert browser.device.ipad?
    assert_equal :ipad, browser.device.id
    assert_equal "iPad", browser.device.name
  end

  test "detects old ipad" do
    browser = Browser.new(Browser["IOS3"])
    assert browser.device.ipad?
    assert_equal :ipad, browser.device.id
    assert_equal "iPad", browser.device.name
  end

  test "detects ipod" do
    browser = Browser.new(Browser["IPOD"])
    assert browser.device.ipod_touch?
    assert browser.device.ipod?
    assert_equal :ipod_touch, browser.device.id
    assert_equal "iPod Touch", browser.device.name
  end

  test "detects iphone" do
    browser = Browser.new(Browser["IOS8"])
    assert browser.device.iphone?
    assert_equal :iphone, browser.device.id
    assert_equal "iPhone", browser.device.name
  end

  test "detects ps3" do
    browser = Browser.new(Browser["PLAYSTATION3"])
    assert browser.device.ps3?
    assert browser.device.playstation3?
    assert browser.device.playstation?
    assert_equal :ps3, browser.device.id
    assert_equal "PlayStation 3", browser.device.name
  end

  test "detects ps4" do
    browser = Browser.new(Browser["PLAYSTATION4"])
    assert browser.device.ps4?
    assert browser.device.playstation4?
    assert browser.device.playstation?
    assert_equal :ps4, browser.device.id
    assert_equal "PlayStation 4", browser.device.name
  end

  test "detects xbox 360" do
    browser = Browser.new(Browser["XBOX360"])

    assert browser.device.console?
    assert browser.device.xbox?
    assert browser.device.xbox_360?
    refute browser.device.xbox_one?
    assert_equal :xbox_360, browser.device.id
    assert_equal "Xbox 360", browser.device.name
  end

  test "detects xbox one" do
    browser = Browser.new(Browser["XBOXONE"])

    assert browser.device.console?
    assert browser.device.xbox?
    assert browser.device.xbox_one?
    refute browser.device.xbox_360?
    assert_equal :xbox_one, browser.device.id
    assert_equal "Xbox One", browser.device.name
  end

  test "detects psp" do
    browser = Browser.new(Browser["PSP"])
    assert browser.device.psp?
    assert_equal :psp, browser.device.id
    assert_equal "PlayStation Portable", browser.device.name
  end

  test "detects psvita" do
    browser = Browser.new(Browser["PSP_VITA"])
    assert browser.device.playstation_vita?
    assert browser.device.vita?
    assert_equal :psvita, browser.device.id
    assert_equal "PlayStation Vita", browser.device.name
  end

  test "detects kindle" do
    browser = Browser.new(Browser["KINDLE"])
    assert browser.device.kindle?
    assert_equal :kindle, browser.device.id
    assert_equal "Kindle", browser.device.name
    refute browser.device.silk?
  end

  %w[
    KINDLE_FIRE
    KINDLE_FIRE_HD
    KINDLE_FIRE_HD_MOBILE
  ].each do |key|
    test "detects #{key} as kindle fire" do
      browser = Browser.new(Browser[key])

      assert browser.device.kindle?
      assert browser.device.kindle_fire?
      assert_equal :kindle_fire, browser.device.id
      assert_equal "Kindle Fire", browser.device.name
    end
  end

  test "detects wii" do
    browser = Browser.new(Browser["NINTENDO_WII"])
    assert browser.device.nintendo_wii?
    assert browser.device.console?
    assert browser.device.nintendo?
    assert browser.device.wii?
    assert_equal :wii, browser.device.id
    assert_equal "Nintendo Wii", browser.device.name
  end

  test "detects wiiu" do
    browser = Browser.new(Browser["NINTENDO_WIIU"])
    assert browser.device.nintendo_wiiu?
    assert browser.device.wiiu?
    assert browser.device.console?
    assert browser.device.nintendo?
    assert_equal :wiiu, browser.device.id
    assert_equal "Nintendo WiiU", browser.device.name
  end

  test "detects blackberry playbook" do
    browser = Browser.new(Browser["PLAYBOOK"])
    assert browser.device.playbook?
    assert browser.device.blackberry_playbook?
    assert_equal :playbook, browser.device.id
    assert_equal "BlackBerry Playbook", browser.device.name
  end

  test "detects surface" do
    browser = Browser.new(Browser["SURFACE"])
    assert browser.device.surface?
    assert_equal :surface, browser.device.id
    assert_equal "Microsoft Surface", browser.device.name
  end

  test "detects tv" do
    browser = Browser.new(Browser["SMART_TV"])
    assert browser.device.tv?
    assert_equal :tv, browser.device.id
    assert_equal "TV", browser.device.name
  end

  test "detects unknown device" do
    browser = Browser.new("")

    assert browser.device.unknown?
    assert_equal "Unknown", browser.device.name
  end

  %w[
    ANDROID
    SYMBIAN
    MIDP
    IPHONE
    IPOD
    WINDOWS_MOBILE
    WINDOWS_PHONE
    WINDOWS_PHONE8
    WINDOWS_PHONE_81
    OPERA_MINI
    LUMIA800
    MS_EDGE_MOBILE
    UC_BROWSER
    NOKIA
    OPERA_MOBI
    KINDLE_FIRE_HD_MOBILE
  ].each do |key|
    test "detects #{key} as mobile" do
      browser = Browser.new(Browser[key])
      assert browser.device.mobile?
      refute browser.device.tablet?
    end
  end

  %w[
    PLAYBOOK
    IPAD
    NEXUS_TABLET
    SURFACE
    XOOM
    NOOK
    SAMSUNG
    FIREFOX_TABLET
    NEXUS7
  ].each do |key|
    test "detects #{key} as tablet" do
      browser = Browser.new(Browser[key])
      assert browser.device.tablet?
      refute browser.device.mobile?
    end
  end
end
