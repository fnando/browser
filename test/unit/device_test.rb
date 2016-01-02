require "test_helper"

class DeviceTest < Minitest::Test
  test "detect generic device" do
    device = Browser::Device.new("")

    assert device.unknown?
    assert_equal :unknown, device.id
  end

  test "detect ipad" do
    device = Browser::Device.new(Browser["IOS9"])
    assert device.ipad?
    assert_equal :ipad, device.id
  end

  test "detect ipod" do
    device = Browser::Device.new(Browser["IPOD"])
    assert device.ipod_touch?
    assert device.ipod?
    assert_equal :ipod_touch, device.id
  end

  test "detect iphone" do
    device = Browser::Device.new(Browser["IOS8"])
    assert device.iphone?
    assert_equal :iphone, device.id
  end

  test "detect ps3" do
    device = Browser::Device.new(Browser["PLAYSTATION3"])
    assert device.ps3?
    assert device.playstation3?
    assert device.playstation?
    assert_equal :ps3, device.id
  end

  test "detect ps4" do
    device = Browser::Device.new(Browser["PLAYSTATION4"])
    assert device.ps4?
    assert device.playstation4?
    assert device.playstation?
    assert_equal :ps4, device.id
  end

  test "detects xbox 360" do
    device = Browser::Device.new(Browser["XBOX360"])

    assert device.console?
    assert device.xbox?
    refute device.xbox_one?
  end

  test "detects xbox one" do
    device = Browser::Device.new(Browser["XBOXONE"])

    assert device.console?
    assert device.xbox?
    assert device.xbox_one?
  end

  test "detect psp" do
    device = Browser::Device.new(Browser["PSP"])
    assert device.psp?
  end

  test "detect psvita" do
    device = Browser::Device.new(Browser["PSP_VITA"])
    assert device.playstation_vita?
    assert device.vita?
    assert_equal :psvita, device.id
  end

  test "detect kindle" do
    device = Browser::Device.new(Browser["KINDLE"])
    assert device.kindle?
    assert_equal :kindle, device.id
    refute device.silk?
  end

  %w[
    KINDLE_FIRE
    KINDLE_FIRE_HD
    KINDLE_FIRE_HD_MOBILE
  ].each do |key|
    test "detect #{key} as kindle fire" do
      device = Browser::Device.new(Browser[key])

      assert device.kindle?
      assert device.kindle_fire?
      assert_equal :kindle_fire, device.id
    end
  end

  test "detect wii" do
    device = Browser::Device.new(Browser["NINTENDO_WII"])
    assert device.nintendo_wii?
    assert device.console?
    assert device.nintendo?
    assert device.wii?
    assert_equal :wii, device.id
  end

  test "detect wiiu" do
    device = Browser::Device.new(Browser["NINTENDO_WIIU"])
    assert device.nintendo_wiiu?
    assert device.wiiu?
    assert device.console?
    assert device.nintendo?
    assert_equal :wiiu, device.id
  end

  test "detect blackberry playbook" do
    device = Browser::Device.new(Browser["PLAYBOOK"])
    assert device.playbook?
    assert device.blackberry_playbook?
    assert_equal :playbook, device.id
  end

  test "detect surface" do
    device = Browser::Device.new(Browser["SURFACE"])
    assert device.surface?
    assert_equal :surface, device.id
  end

  test "detect tv" do
    device = Browser::Device.new(Browser["SMART_TV"])
    assert device.tv?
    assert_equal :tv, device.id
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
    test "detect #{key} as mobile" do
      device = Browser::Device.new(Browser[key])
      assert device.mobile?
      refute device.tablet?
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
  ].each do |key|
    test "detect #{key} as tablet" do
      device = Browser::Device.new(Browser[key])
      assert device.tablet?
      refute device.mobile?
    end
  end
end
