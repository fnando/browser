# frozen_string_literal: true

require "test_helper"

class IosAppTest < Minitest::Test
  let(:browser) { Browser.new(Browser["IOS_WEBVIEW"]) }

  test "detects as ios" do
    assert browser.platform.ios?
  end

  test "does not detect as safari" do
    refute browser.safari?
  end

  test "detects as webview" do
    assert browser.platform.ios_webview?
  end
end
