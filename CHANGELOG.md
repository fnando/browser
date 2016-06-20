# Changelog

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
- [List of all commits since last release](https://github.com/fnando/browser/compare/v1.1.0...v2.0.0)
