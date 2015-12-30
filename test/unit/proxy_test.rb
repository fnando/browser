require "test_helper"

class ProxyTest < Minitest::Test
  %w[
    NOKIA
    OPERA_MINI
    UC_BROWSER
  ].each do |name|
    ua = $ua[name]

    test "detect #{ua} as proxy" do
      browser = Browser.new(ua: ua)

      assert browser.proxy?
      assert browser.meta.include?("proxy")
    end
  end
end
