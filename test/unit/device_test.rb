# frozen_string_literal: true

require "test_helper"

class DeviceTest < Minitest::Test
  class CustomDevice < Browser::Device::Base
    def match?
      ua.include?("Custom")
    end

    def id
      :custom
    end
  end

  test "extends matchers" do
    Browser::Device.matchers.unshift(CustomDevice)
    device = Browser::Device.new("Custom")

    assert_equal :custom, device.id

    Browser::Device.matchers.shift
    device = Browser::Device.new("Custom")

    assert_equal :unknown_device, device.id
  end

  test "detects generic device" do
    device = Browser::Device.new("")

    assert device.unknown?
    assert_equal :unknown_device, device.id
  end

  test "detects ipad" do
    device = Browser::Device.new(Browser["IOS9"])

    assert device.ipad?
    assert_equal :ipad, device.id
    assert_equal "iPad", device.name
  end

  test "detects old ipad" do
    device = Browser::Device.new(Browser["IOS3"])

    assert device.ipad?
    assert_equal :ipad, device.id
    assert_equal "iPad", device.name
  end

  test "detects ipod" do
    device = Browser::Device.new(Browser["IPOD"])

    assert device.ipod_touch?
    assert device.ipod?
    assert_equal :ipod_touch, device.id
    assert_equal "iPod Touch", device.name
  end

  test "detects iphone" do
    device = Browser::Device.new(Browser["IOS8"])

    assert device.iphone?
    assert_equal :iphone, device.id
    assert_equal "iPhone", device.name
  end

  test "detects ps3" do
    device = Browser::Device.new(Browser["PLAYSTATION3"])

    assert device.ps3?
    assert device.playstation3?
    assert device.playstation?
    assert_equal :ps3, device.id
    assert_equal "PlayStation 3", device.name
  end

  test "detects ps4" do
    device = Browser::Device.new(Browser["PLAYSTATION4"])

    assert device.ps4?
    assert device.playstation4?
    assert device.playstation?
    assert_equal :ps4, device.id
    assert_equal "PlayStation 4", device.name
  end

  test "detects xbox 360" do
    device = Browser::Device.new(Browser["XBOX360"])

    assert device.console?
    assert device.xbox?
    assert device.xbox_360?
    refute_predicate device, :xbox_one?
    assert_equal :xbox_360, device.id
    assert_equal "Xbox 360", device.name
  end

  test "detects xbox one" do
    device = Browser::Device.new(Browser["XBOXONE"])

    assert device.console?
    assert device.xbox?
    assert device.xbox_one?
    refute_predicate device, :xbox_360?
    assert_equal :xbox_one, device.id
    assert_equal "Xbox One", device.name
  end

  test "detects psp" do
    device = Browser::Device.new(Browser["PSP"])

    assert device.psp?
    assert_equal :psp, device.id
    assert_equal "PlayStation Portable", device.name
  end

  test "detects psvita" do
    device = Browser::Device.new(Browser["PSP_VITA"])

    assert device.playstation_vita?
    assert device.vita?
    assert_equal :psvita, device.id
    assert_equal "PlayStation Vita", device.name
  end

  test "detects kindle" do
    device = Browser::Device.new(Browser["KINDLE"])

    assert device.kindle?
    assert_equal :kindle, device.id
    assert_equal "Kindle", device.name
    refute_predicate device, :silk?
  end

  %w[
    KINDLE_FIRE
    KINDLE_FIRE_HD
    KINDLE_FIRE_HD_MOBILE
  ].each do |key|
    test "detects #{key} as kindle fire" do
      device = Browser::Device.new(Browser[key])

      assert device.kindle?
      assert device.kindle_fire?
      assert_equal :kindle_fire, device.id
      assert_equal "Kindle Fire", device.name
    end
  end

  test "detects wii" do
    device = Browser::Device.new(Browser["NINTENDO_WII"])

    assert device.nintendo_wii?
    assert device.console?
    assert device.nintendo?
    assert device.wii?
    assert_equal :wii, device.id
    assert_equal "Nintendo Wii", device.name
  end

  test "detects wiiu" do
    device = Browser::Device.new(Browser["NINTENDO_WIIU"])

    assert device.nintendo_wiiu?
    assert device.wiiu?
    assert device.console?
    assert device.nintendo?
    assert_equal :wiiu, device.id
    assert_equal "Nintendo WiiU", device.name
  end

  test "detects switch" do
    device = Browser::Device.new(Browser["NINTENDO_SWITCH"])

    assert device.nintendo_switch?
    assert device.switch?
    assert device.console?
    assert device.nintendo?
    assert_equal :switch, device.id
    assert_equal "Nintendo Switch", device.name
  end

  test "detects blackberry playbook" do
    device = Browser::Device.new(Browser["PLAYBOOK"])

    assert device.playbook?
    assert device.blackberry_playbook?
    assert_equal :playbook, device.id
    assert_equal "BlackBerry Playbook", device.name
  end

  test "detects surface" do
    device = Browser::Device.new(Browser["SURFACE"])

    assert device.surface?
    assert_equal :surface, device.id
    assert_equal "Microsoft Surface", device.name
  end

  test "detects tv" do
    device = Browser::Device.new(Browser["SMART_TV"])

    assert device.tv?
    assert_equal :tv, device.id
    assert_equal "TV", device.name
  end

  test "detects unknown device" do
    device = Browser::Device.new("")

    assert device.unknown?
    assert_equal "Unknown", device.name
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
      device = Browser::Device.new(Browser[key])

      assert device.mobile?
      refute_predicate device, :tablet?
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
      device = Browser::Device.new(Browser[key])

      assert device.tablet?
      refute_predicate device, :mobile?
    end
  end

  {
    "ANDROID_CUPCAKE" => "T-Mobile G1",
    "ANDROID_DONUT" => "SonyEricssonX10i",
    "ANDROID_ECLAIR_21" => "Nexus One",
    "ANDROID_FROYO" => "HTC_DesireHD_A9191",
    "ANDROID_GINGERBREAD" => "Sensation_4G",
    "ANDROID_HONEYCOMB_30" => "Xoom",
    "ANDROID_ICECREAM" => "sdk",
    "ANDROID_JELLYBEAN_41" => "Nexus S",
    "ANDROID_JELLYBEAN_42" => "Nexus 10",
    "ANDROID_JELLYBEAN_43" => "Nexus 7",
    "CUSTOM_APP" => "HTC Ruby",
    "NOOK" => "NOOK BNTV250A"
  }.each do |key, name|
    test "detects device name of #{key} as #{name}" do
      device = Browser::Device.new(Browser[key])

      assert_equal name, device.name
    end
  end

  test "detects samsung devices" do
    device = Browser::Device.new(Browser["SAMSUNG_SM-G975F"])

    assert device.samsung?
    assert_equal :samsung, device.id
    assert_equal "Samsung Galaxy S10+", device.name
  end

  test "detects generic samsung devices" do
    device = Browser::Device.new(Browser["SAMSUNG_SM-FAKE"])

    assert device.samsung?
    assert_equal :samsung, device.id
    assert_equal "Samsung SM-0000", device.name
  end

  {
    "SAMSUNG_SM-G975F" => "Samsung Galaxy S10+",
    "SAMSUNG_SM-G960F" => "Samsung Galaxy S9",
    "SAMSUNG_SM-F700F" => "Samsung Galaxy Z Flip"
  }.each do |key, name|
    test "detects device name of #{key} as #{name}" do
      device = Browser::Device.new(Browser[key])

      assert_equal name, device.name
    end
  end
end
