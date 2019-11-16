# frozen_string_literal: true

require "test_helper"

class SnapchatTest < Minitest::Test
  test "detects snapchat" do
    browser = Browser.new(Browser["SNAPCHAT"])

    assert_equal "Snapchat", browser.name
    assert browser.snapchat?
    assert :snapchat, browser.id
    assert_equal "10.69.5.72", browser.full_version
    assert_equal "10", browser.version
  end

  test "detects version by range" do
    browser = Browser.new(Browser["SNAPCHAT"])
    assert browser.snapchat?(%w[>=10])
  end
end
