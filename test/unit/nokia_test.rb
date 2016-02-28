# frozen_string_literal: true
require "test_helper"

class NokiaTest < Minitest::Test
  test "detects Nokia S40" do
    browser = Browser.new(Browser["NOKIA"])
    assert browser.nokia?
    assert_equal "Nokia S40 Ovi Browser", browser.name
  end
end
