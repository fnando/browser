# frozen_string_literal: true

require "test_helper"

class AndroidTest < Minitest::Test
  test "detects android cupcake (1.5)" do
    browser = Browser.new(Browser["ANDROID_CUPCAKE"])

    assert browser.platform.android?
    assert browser.platform.android?(1.5)
  end

  test "detects android donut (1.6)" do
    browser = Browser.new(Browser["ANDROID_DONUT"])

    assert browser.platform.android?
    assert browser.platform.android?(1.6)
  end

  test "detects android eclair (2.1)" do
    browser = Browser.new(Browser["ANDROID_ECLAIR_21"])

    assert browser.platform.android?
    assert browser.platform.android?(2.1)
  end

  test "detects android froyo (2.2)" do
    browser = Browser.new(Browser["ANDROID_FROYO"])

    assert browser.platform.android?
    assert browser.platform.android?(2.2)
  end

  test "detects android gingerbread (2.3)" do
    browser = Browser.new(Browser["ANDROID_GINGERBREAD"])

    assert browser.platform.android?
    assert browser.platform.android?("~> 2.3.0")
  end

  test "detects android honeycomb (3.0)" do
    browser = Browser.new(Browser["ANDROID_HONEYCOMB_30"])

    assert browser.platform.android?
    assert browser.platform.android?("~> 3.0")
  end

  test "detects android ice cream sandwich (4.0)" do
    browser = Browser.new(Browser["ANDROID_ICECREAM"])

    assert browser.platform.android?
    assert browser.platform.android?("~> 4.0")
  end

  test "detects android jellybean (4.1)" do
    browser = Browser.new(Browser["ANDROID_JELLYBEAN_41"])

    assert browser.platform.android?
    assert browser.platform.android?("~> 4.1")
  end

  test "detects android jellybean (4.2)" do
    browser = Browser.new(Browser["ANDROID_JELLYBEAN_42"])

    assert browser.platform.android?
    assert browser.platform.android?(4.2)
  end

  test "detects android jellybean (4.3)" do
    browser = Browser.new(Browser["ANDROID_JELLYBEAN_43"])

    assert browser.platform.android?
    assert browser.platform.android?(4.3)
  end

  test "detects android kitkat (4.4)" do
    browser = Browser.new(Browser["ANDROID_KITKAT"])

    assert browser.platform.android?
    assert browser.platform.android?(4.4)
  end

  test "detects android lollipop (5.0)" do
    browser = Browser.new(Browser["ANDROID_LOLLIPOP_50"])

    assert browser.platform.android?
    assert browser.platform.android?(5.0)
  end

  test "detects android lollipop (5.1)" do
    browser = Browser.new(Browser["ANDROID_LOLLIPOP_51"])

    assert browser.platform.android?
    assert browser.platform.android?(5.1)
  end

  test "detects android oreo (8.0)" do
    browser = Browser.new(Browser["ANDROID_OREO"])

    assert browser.platform.android?
    assert browser.platform.android?(8.0)
  end

  test "detects android tv" do
    browser = Browser.new(Browser["ANDROID_TV"])

    assert browser.platform.android?
    assert browser.device.tv?
  end

  test "detects nexus player" do
    browser = Browser.new(Browser["ANDROID_NEXUS_PLAYER"])

    assert browser.platform.android?
  end

  test "detects firefox for android without android version" do
    browser = Browser.new(Browser["FIREFOX_ANDROID"])

    assert browser.platform.android?
    refute browser.platform.android?(5)
  end
end
