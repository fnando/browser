# frozen_string_literal: true
require "test_helper"

class MicroMessengerTest < Minitest::Test
  test "detects micro messenger 6.3.15" do
    browser = Browser.new(Browser["MICRO_MESSENGER"])
    assert browser.micro_messenger?
    assert browser.wechat?
    assert_equal "MicroMessenger", browser.name
  end
end
