require "test_helper"

class OperaTest < Minitest::Test
  setup do
    @browser = Browser.new
  end

  test "detects opera" do
    @browser.ua = $ua["OPERA"]

    assert_equal "Opera", @browser.name
    assert @browser.opera?
    refute @browser.modern?
    assert_equal "11.64", @browser.full_version
    assert_equal "11", @browser.version
  end

  test "detects opera next" do
    @browser.ua = $ua["OPERA_NEXT"]

    assert_equal "Opera", @browser.name
    assert_equal :opera, @browser.id
    assert @browser.opera?
    assert @browser.webkit?
    assert @browser.modern?
    refute @browser.chrome?
    assert_equal "15.0.1147.44", @browser.full_version
    assert_equal "15", @browser.version
  end

  test "detects opera mini" do
    @browser.ua = $ua["OPERA_MINI"]

    assert @browser.opera_mini?
    refute @browser.tablet?
    assert @browser.mobile?
  end

  test "detects opera mobi" do
    @browser.ua = $ua["OPERA_MOBI"]

    assert @browser.opera?
    refute @browser.tablet?
    assert @browser.mobile?
  end
end
