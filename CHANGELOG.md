# Changelog

## Unreleased

- Handle Snapchat user agents that have a space or an empty string instead of a slash before the version.
- Fix iOS 10+ version detection.
- Add fallback versions for instagram and snapchat to avoid NoMethodErrors on unexpected user agents.

## 2.7.0

- Add more Slack bots.
- Handle instagram user agents that have a slash instead of a space.
- Add `Browser::Bot.why?(ua)` to help debugging why a user agent is considered bot.
- Promote Snapchat to a browser (it was detected as a bot previously).
- Detect Edge based on Chrome correctly.
- Improve Yandex detection.
- Add Sputnik (https://browser.sputnik.ru)
- Detect Android devices.
- Add ScoutURLMonitor to the bot list.

## 2.6.1

- Also include controller extensions to `ActionController::Base`.

## 2.6.0

- Add GarlikCrawler, ImplisenseBot and WikiDo bots.
- Add Mastodon URL expander bot.
- Add eZ Publish Link Validator, GermCrawler, Pu_iN Crawler, ZoomBot, and ZoominfoBot bots.
- Add Datanyze bot.
- Add support for Instagram in-app browser.
- Add Updown.io monitor bot.
- Add Snapshat detection.
- Add Instagram detection.
- Add Nintendo Switch detection.
- Add WooRank bot.
- Add Trendsmap bot.
- Add Go 1.1 package http bot.
- Add MauiBot.
- Add SiteCheck-sitecrawl bot.
- Add PR-CY.RU bot.
- Add AdsTxtCrawler bot.
- Add HTTrack bot.
- Add Google Shopping bot.
- Add DataFeedWatch bot.
- Add Zabbix bot.
- Add TangibleeBot.
- Add Jooble bot.
- Add Fyre bot.
- Drop Rails 4 official support.
- Fix accept-language sorting (If HTTP-header has value `en,fr`—without qualities—the first language should be `en` instead of `fr`).
- Ignore malformed strings when comparing versions.
- Fix Facebook detection on newer apps.
- Change precedence for bot detection when common libs are used.
- Add Yandex's search browser to the exception list.


## v2.5.3

- Add Google Site Verification to the bot list.
- Handle invalid quality values that look like numbers.
- Add Barkrowler bot.
- Add AlwaysOnline bot: CloudFlare.
- Add News aggregator crawler: AndersPink, BuzzBot.
- Add Domain crawler: CipaCrawler.
- Add Job bot: JobSeeker's.
- Add Apparel crawler: TeeRaid.
- Add Search engine crawler: SemanticBot, Mappy.
- Add Copyright crawler: Copypants' BotPants.
- Add SEO bots: SEOdiver, SeoAudit, WebCeo.
- Add Woriobot from Zite.
- Add BUbiNG bot.
- Add Paessler bot.

## v2.5.2

- Add COMODO SSL Checker bot.
- Add Swiftype bot.
- Add WhatsApp detection.

## v2.5.1

- Add Android Oreo detection.

## v2.5.0

- Add support for QQ Browser Mac & Mac Lite.
- Add support for Electron Framework.
- Add support for Facebook in-app browser.
- Add support for Otter Browser.
- Add Android webview detection.

## v2.4.0

- Add Google Drive API, Proximic Spider, NewRelic pinger and SocialRank bots.
- Add Pinboard in-app browser to the bot exception list.
- All browser detection methods can now compare versions.
- All platform detection methods can now compare versions (except `#linux?` and `#firefox_os?`).
- Add `browser/aliases`, so you can have methods on the base object (e.g. `browser.mobile?`). See README for instructions.
- Remove official support for Rails 3 and Ruby 2.1.

## v2.3.0

- Add AWS ELB bot.
- Add CommonCrawl and Yahoo Ad Monitoring bots.
- Add Google Stackdriver Uptime Check bot.
- Add Microsoft Bing bots (adldxbot, bingpreview, and msnbot-media).
- Add Stripe and Netcraft bots.
- Add support for loading browser without extending Rails' helpers.
- Add Watchsumo bot.
- Match Alipay.

## v2.2.0

- `Browser::Platform#windows?` can now compare versions.
- `Browser::Platform#mac?` can now compare versions.
- Detect QQ Browser.
- Fix issue with Mac user agents that didn't include the version.

## v2.1.0

- Add PrivacyAwareBot, ltx71, Squider and Traackr to bots.
- Match Google Structured Data alternative bot.
- Match MicroMessenger (WeChat).
- Match Weibo.
- Detect Windows & Mac OS versions.

## v2.0.3

- Fix issue with version detection when no actual version is provided (i.e. the user agent doesn't have any version information).

## v2.0.2

- Fix issue when user agent is set to `nil`.
- Fix issue with user agent without version information.

## v2.0.1

- Fix Rails integration.

## v2.0.0

- `Browser#platform` now returns instance of `Browser::Platform`, instead of a `String`. It contains information about the platform (software).
- `Browser#device` was added. It returns information about the device (hardware).
- `Browser#accept_language` now returns a list of `Browser::AcceptLanguage` objects.
- `Browser#bot` now returns a `Browser::Bot` instance.
- Safari running as web app mode is not recognized as Safari anymore.
- ruby-2.3+ will always activate frozen strings.
- [List of all commits since last release](https://github.com/fnando/browser/compare/v1.1.0...v2.0.0).
