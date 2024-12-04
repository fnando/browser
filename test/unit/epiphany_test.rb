# frozen_string_literal: true

require "test_helper"

class EpiphanyBrowserTest < Minitest::Test
  test "detects epiphany browser" do
    browser = Browser.new(Browser["EPIPHANY"])

    assert browser.epiphany?
    refute browser.safari?
    assert_equal "Epiphany", browser.name
    assert_equal :epiphany, browser.id
    assert_equal "3.18.11", browser.full_version
    assert_equal "3", browser.version
  end

  test "detects version by range" do
    browser = Browser.new(Browser["EPIPHANY"])
    assert browser.epiphany?(%w[=3.18.11])
  end
end
