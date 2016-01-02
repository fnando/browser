require "test_helper"

class BotsTest < Minitest::Test
  %w[
    APPLE_BOT
    DOMAINAREANIMATOR
    DOT_BOT
    FACEBOOK_BOT
    GOOGLE_BOT
    GOOGLE_PAGE_SPEED_INSIGHTS
    GOOGLE_STRUCTURED_DATA_TESTING_TOOL
    GRAPESHOT
    LINKDEXBOT
    LOAD_TIME_BOT
    MAIL_RU
    MEGAINDEX_RU
    MSN_BOT
    QUERYSEEKER
    SCRAPY
    SEOKICKS
    SISTRIX
    TINEYE
    YANDEX_DIRECT
    YANDEX_METRIKA
  ].each do |key|
    test "detect #{key} as bot" do
      browser = Browser.new(ua: Browser[key])
      assert browser.bot?
    end
  end

  test "don't detect as bot" do
    browser = Browser.new(UA: Browser["CHROME"])
    refute browser.bot?
  end

  test "doesn't consider empty UA as bot" do
    browser = Browser.new(ua: "")
    refute browser.bot?
  end

  test "allows setting empty string as bots" do
    Browser::Bot.detect_empty_ua!
    browser = Browser.new(ua: "")

    assert browser.bot?
  end

  test "doesn't detect mozilla as a bot when considering empty UA" do
    Browser::Bot.detect_empty_ua!
    browser = Browser.new(ua: "Mozilla")

    refute browser.bot?
  end

  test "returns bot name" do
    browser = Browser.new(ua: Browser["GOOGLE_BOT"])
    assert_equal "Google Bot", browser.bot.name

    browser = Browser.new(ua: Browser["FACEBOOK_BOT"])
    assert_equal "Facebook Bot", browser.bot.name
  end

  test "returns bot name (empty string ua detection enabled)" do
    Browser::Bot.detect_empty_ua!
    browser = Browser.new(ua: "")

    assert_equal browser.bot.name, "Generic Bot"
  end

  test "returns nil for non-bots" do
    browser = Browser.new(UA: Browser["CHROME"])
    assert_nil browser.bot.name
  end

  %w[
    ASK
    BAIDU
    BINGBOT
    DUCKDUCKGO
    GOOGLE_BOT
    YAHOO_SLURP
  ].each do |key|
    test "detect #{key} as search engines" do
      browser = Browser.new(ua: Browser[key])
      assert browser.bot.search_engine?
    end
  end

  test "detects Daumoa" do
    browser = Browser.new(ua: Browser["DAUMOA"])

    assert_equal :ie, browser.id
    assert_equal "Internet Explorer", browser.name
    assert_equal "0.0", browser.msie_full_version
    assert_equal "0", browser.msie_version
    assert_equal "0.0", browser.full_version
    assert_equal "0", browser.version
    assert browser.ie?
    assert browser.bot?
    refute browser.platform.windows10?
    refute browser.platform.windows_phone?
    refute browser.edge?
    refute browser.modern?
    refute browser.device.mobile?
    refute browser.webkit?
    refute browser.chrome?
    refute browser.safari?
  end

  test "custom android user agent (#144)" do
    browser = Browser.new(ua: Browser["CUSTOM_APP"])

    assert browser.platform.android?
    refute browser.bot?
  end
end
