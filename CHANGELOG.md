# Changelog

## v2.0.1 [unreleased]

- Fix Rails integration.

## v2.0.0

- `Browser#platform` now returns instance of `Browser::Platform`, instead of a `String`. It contains information about the platform (software).
- `Browser#device` was added. It returns information about the device (hardware).
- `Browser#accept_language` now returns a list of `Browser::AcceptLanguage` objects.
- `Browser#bot` now returns a `Browser::Bot` instance.
- Safari running as web app mode is not recognized as Safari anymore.
- ruby-2.3+ will always activate frozen strings.
- [List of all commits since last release](https://github.com/fnando/browser/compare/v1.1.0...v2.0.0)
