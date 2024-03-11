# frozen_string_literal: true

require "test_helper"

class GenericTest < Minitest::Test
  test "returns default msie version" do
    browser = Browser.new("")

    assert_equal "0.0", browser.msie_full_version
    assert_equal "0", browser.msie_version
  end

  test "returns default compatibility view" do
    browser = Browser.new("")

    refute browser.compatibility_view?
  end

  test "returns default safari web app mode" do
    browser = Browser.new("")

    refute browser.safari_webapp_mode?
  end
end
