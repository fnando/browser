require "test_helper"

class IosAppTest < Minitest::Test
  let(:browser) { Browser.new(ua: $ua["IOS_WEBVIEW"]) }

  test "detect as ios" do
    assert browser.ios?
  end

  test "don't detect as safari" do
    refute browser.safari?
  end

  test "detect as webview" do
    assert browser.ios_webview?
  end
end
