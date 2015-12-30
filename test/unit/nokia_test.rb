require "test_helper"

class NokiaTest < Minitest::Test
  setup do
    @browser = Browser.new(ua: $ua["NOKIA"])
  end

  test "detects Nokia S40" do
    assert @browser.mobile?
    assert @browser.nokia?
    assert_equal @browser.name, "Nokia S40 Ovi Browser"
  end
end
