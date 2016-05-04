require "test_helper"

class GenericTest < Minitest::Test
  test "return default msie version" do
    browser = Browser.new("")

    assert_equal "0.0", browser.msie_full_version
    assert_equal "0", browser.msie_version
  end
end
