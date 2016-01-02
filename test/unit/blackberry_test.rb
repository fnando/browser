require "test_helper"

class BlackberryTest < Minitest::Test
  setup do
    @browser = Browser.new
  end

  test "detects blackberry" do
    @browser.ua = Browser["BLACKBERRY"]

    assert_equal "Other", @browser.name
    refute @browser.device.tablet?
    assert @browser.device.mobile?
    refute @browser.modern?
    assert_equal "0.0", @browser.full_version
    assert_equal "0", @browser.version
  end

  test "detects blackberry4" do
    @browser.ua = Browser["BLACKBERRY4"]

    assert_equal "Other", @browser.name
    refute @browser.modern?
    assert_equal "0.0", @browser.full_version
    assert_equal "0", @browser.version
  end

  test "detects blackberry5" do
    @browser.ua = Browser["BLACKBERRY5"]

    assert_equal "Other", @browser.name
    refute @browser.device.tablet?
    assert @browser.device.mobile?
    refute @browser.modern?
    assert_equal "0.0", @browser.full_version
    assert_equal "0", @browser.version
  end

  test "detects blackberry6" do
    @browser.ua = Browser["BLACKBERRY6"]

    assert_equal "Safari", @browser.name
    refute @browser.device.tablet?
    assert @browser.device.mobile?
    assert @browser.modern?
    assert_equal "534.11", @browser.full_version
    assert_equal "534", @browser.version
  end

  test "detects blackberry7" do
    @browser.ua = Browser["BLACKBERRY7"]

    assert_equal "Safari", @browser.name
    refute @browser.device.tablet?
    assert @browser.device.mobile?
    assert @browser.modern?
    assert_equal "534.11", @browser.full_version
    assert_equal "534", @browser.version
  end

  test "detects blackberry10" do
    @browser.ua = Browser["BLACKBERRY10"]

    assert_equal "Safari", @browser.name
    refute @browser.device.tablet?
    assert @browser.device.mobile?
    assert @browser.modern?
    assert_equal "537.10", @browser.full_version
    assert_equal "537", @browser.version
  end

  test "detects blackberry playbook tablet" do
    @browser.ua = Browser["PLAYBOOK"]

    refute @browser.platform.android?
    assert @browser.device.tablet?
    refute @browser.device.mobile?

    assert_equal "536.2", @browser.full_version
    assert_equal "536", @browser.version
  end

  test "don't detect as two different versions" do
    @browser.ua = Browser["BLACKBERRY10"]
    assert @browser.platform.blackberry?(10)
    refute @browser.platform.blackberry?(7)
  end
end
