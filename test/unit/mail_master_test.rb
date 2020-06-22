# frozen_string_literal: true

require "test_helper"

class MailMasterTest < Minitest::Test
  test "detects MailMaster on iOS" do
    browser = Browser.new(Browser["MAIL_MASTER_IOS"])
    assert browser.platform.ios?("13.4.1")
    assert browser.mail_master?
    refute browser.safari?
    refute browser.chrome?
    assert_equal "Mail Master", browser.name
    assert_equal :mail_master, browser.id
  end

  test "detects correct version on iOS" do
    browser = Browser.new(Browser["MAIL_MASTER_IOS"])
    assert_equal "6.22.4.1582", browser.full_version
    assert_equal "6", browser.version
  end

  test "detects version by range on iOS" do
    browser = Browser.new(Browser["MAIL_MASTER_IOS"])
    assert browser.mail_master?(%w[>=6 <7])
  end

  test "detects MailMaster on Android" do
    browser = Browser.new(Browser["MAIL_MASTER_ANDROID"])
    assert browser.platform.android?(10)
    assert browser.mail_master?
    refute browser.safari?
    refute browser.chrome?
    assert_equal "Mail Master", browser.name
    assert_equal :mail_master, browser.id
  end

  test "detects correct version on Android" do
    browser = Browser.new(Browser["MAIL_MASTER_ANDROID"])
    assert_equal "6.22.1", browser.full_version
    assert_equal "6", browser.version
  end

  test "detects version by range on Android" do
    browser = Browser.new(Browser["MAIL_MASTER_ANDROID"])
    assert browser.mail_master?(%w[>=6 <7])
  end
end
