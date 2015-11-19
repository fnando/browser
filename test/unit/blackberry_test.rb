require "test_helper"

class BlackberryTest < Minitest::Test
  setup do
    @browser = Browser.new
  end

  test "detects blackberry" do
    @browser.ua = $ua["BLACKBERRY"]

    assert_equal "BlackBerry", @browser.name
    assert @browser.blackberry?
    refute @browser.tablet?
    assert @browser.mobile?
    refute @browser.modern?
    assert_equal "4.1.0", @browser.full_version
    assert_equal "4", @browser.version
  end

  test "detects blackberry4" do
    @browser.ua = $ua["BLACKBERRY4"]

    assert_equal "BlackBerry", @browser.name
    assert_equal "4", @browser.blackberry_version
    assert @browser.blackberry?(4)
    refute @browser.tablet?
    assert @browser.mobile?
    refute @browser.modern?
    assert_equal "4.2.1", @browser.full_version
    assert_equal "4", @browser.version
  end

  test "detects blackberry5" do
    @browser.ua = $ua["BLACKBERRY5"]

    assert_equal "BlackBerry", @browser.name
    assert @browser.blackberry?(5)
    assert_equal "5", @browser.blackberry_version
    refute @browser.tablet?
    assert @browser.mobile?
    refute @browser.modern?
    assert_equal "5.0.0.93", @browser.full_version
    assert_equal "5", @browser.version
  end

  test "detects blackberry6" do
    @browser.ua = $ua["BLACKBERRY6"]

    assert_equal "Safari", @browser.name
    assert @browser.blackberry?(6)
    assert_equal "6", @browser.blackberry_version
    refute @browser.tablet?
    assert @browser.mobile?
    assert @browser.modern?
    assert_equal "534.11", @browser.full_version
    assert_equal "534", @browser.version
  end

  test "detects blackberry7" do
    @browser.ua = $ua["BLACKBERRY7"]

    assert_equal "Safari", @browser.name
    assert @browser.blackberry?(7)
    assert_equal "7", @browser.blackberry_version
    refute @browser.tablet?
    assert @browser.mobile?
    assert @browser.modern?
    assert_equal "534.11", @browser.full_version
    assert_equal "534", @browser.version
  end

  test "detects blackberry10" do
    @browser.ua = $ua["BLACKBERRY10"]

    assert_equal "Safari", @browser.name
    assert_equal "10", @browser.blackberry_version
    assert @browser.blackberry?(10)
    refute @browser.tablet?
    assert @browser.mobile?
    assert @browser.modern?
    assert_equal "10.0.9.1675", @browser.full_version
    assert_equal "10", @browser.version
  end

  test "detects blackberry playbook tablet" do
    @browser.ua = $ua["PLAYBOOK"]

    refute @browser.android?
    assert @browser.tablet?
    refute @browser.mobile?

    assert_equal "7.2.1.0", @browser.full_version
    assert_equal "7", @browser.version
  end

  test "warn about deprecated numbered version" do
    message = "Browser#blackberry10? is deprecated; use Browser#blackberry?(version) instead"
    assert_deprecated(message, __FILE__, __LINE__) { @browser.blackberry10? }
  end

  test "don't detect as two different versions" do
    @browser.ua = $ua["BLACKBERRY10"]
    assert @browser.blackberry?(10)
    refute @browser.blackberry?(7)
  end
end
