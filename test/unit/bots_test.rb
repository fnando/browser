require "test_helper"

class BotsTest < Minitest::Test
  setup do
    @browser = Browser.new
  end

  test "detects bots" do
    %w[
      APPLE_BOT
      DOMAINAREANIMATOR
      DOT_BOT
      FACEBOOK_BOT
      GOOGLE_BOT
      GRAPESHOT
      LINKDEXBOT
      LOAD_TIME_BOT
      MAIL_RU
      MEGAINDEX_RU
      MSN_BOT
      QUERYSEEKER
      SCRAPY
      SEOKICKS
      TINEYE
      SISTRIX
      YANDEX_DIRECT
      YANDEX_METRIKA
    ].each do |key|
      @browser.ua = $ua[key]
      assert @browser.bot?, "#{$ua[key]} should be a bot"
    end

    @browser.ua = $ua["CHROME"]
    refute @browser.bot?
  end

  test "detects Google Page Speed as a bot" do
    @browser.ua = $ua["GOOGLE_PAGE_SPEED_INSIGHTS"]
    assert @browser.bot?
  end

  test "doesn't consider empty UA as bot" do
    @browser.ua = ""
    refute @browser.bot?
  end

  test "allows setting empty string as bots" do
    Browser::Bots.detect_empty_ua!
    @browser.ua = ""

    assert @browser.bot?
  end

  test "doesn't detect mozilla as a bot when considering empty UA" do
    Browser::Bots.detect_empty_ua!
    @browser.ua = "Mozilla"

    refute @browser.bot?
  end

  test "returns bot name" do
    @browser.ua = $ua["GOOGLE_BOT"]
    assert_equal @browser.bot_name, "Googlebot"

    @browser.ua = $ua["FACEBOOK_BOT"]
    assert_equal @browser.bot_name, "facebookexternalhit"
  end

  test "returns bot name (empty string ua detection enabled)" do
    Browser::Bots.detect_empty_ua!
    @browser.ua = ""

    assert_equal @browser.bot_name, "Generic Bot"
  end

  test "returns nil for non-bots" do
    @browser.ua = $ua["CHROME"]
    assert_equal @browser.bot_name, nil
  end

  test "detects as search engines" do
    %w[
      ASK
      BAIDU
      BINGBOT
      DUCKDUCKGO
      GOOGLE_BOT
      YAHOO_SLURP
    ].each do |key|
      @browser.ua = $ua[key]
      assert @browser.search_engine?, "#{$ua[key]} should be a search engine"
    end
  end

  test "detects Google Structured Data Testing Tool as a bot" do
    @browser.ua = $ua["GOOGLE_STRUCTURED_DATA_TESTING_TOOL"]

    assert @browser.bot?, "Google Structured Data Testing Tool should be a bot"
  end

  test "detects Daumoa" do
    @browser.ua = $ua["DAUMOA"]

    assert_equal :ie, @browser.id
    assert_equal "Internet Explorer", @browser.name
    assert_equal "0.0", @browser.msie_full_version
    assert_equal "0", @browser.msie_version
    assert_equal "0.0", @browser.full_version
    assert_equal "0", @browser.version
    assert @browser.ie?
    assert @browser.bot?
    refute @browser.windows10?
    refute @browser.windows_phone?
    refute @browser.edge?
    refute @browser.modern?
    refute @browser.mobile?
    refute @browser.webkit?
    refute @browser.chrome?
    refute @browser.safari?
  end
end
