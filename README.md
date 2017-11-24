# Browser

[![Travis-CI](https://travis-ci.org/fnando/browser.png)](https://travis-ci.org/fnando/browser)
[![Code Climate](https://codeclimate.com/github/fnando/browser/badges/gpa.svg)](https://codeclimate.com/github/fnando/browser)
[![Test Coverage](https://codeclimate.com/github/fnando/browser/badges/coverage.svg)](https://codeclimate.com/github/fnando/browser/coverage)
[![Gem](https://img.shields.io/gem/v/browser.svg)](https://rubygems.org/gems/browser)
[![Gem](https://img.shields.io/gem/dt/browser.svg)](https://rubygems.org/gems/browser)

Do some browser detection with Ruby. Includes ActionController integration.

## Installation

```bash
gem install browser
```

## Usage

```ruby
require "browser"

browser = Browser.new("Some User Agent", accept_language: "en-us")

# General info
browser.bot?
browser.chrome?
browser.core_media?
browser.edge?                # Newest MS browser
browser.electron?            # Electron Framework
browser.firefox?
browser.full_version
browser.ie?
browser.ie?(6)               # detect specific IE version
browser.ie?([">8", "<10"])   # detect specific IE (IE9).
browser.known?               # has the browser been successfully detected?
browser.meta                 # an array with several attributes
browser.name                 # readable browser name
browser.nokia?
browser.chromium?
browser.opera?
browser.opera_mini?
browser.phantom_js?
browser.quicktime?
browser.safari?
browser.safari_webapp_mode?
browser.to_s            # the meta info joined by space
browser.uc_browser?
browser.version         # major version number
browser.webkit?
browser.webkit_full_version
browser.yandex?
browser.wechat?         # detect the MicroMessenger(WeChat)
browser.weibo?          # detect Weibo embedded browser (Sina Weibo)

# Get bot info
browser.bot.name
browser.bot.search_engine?
browser.bot?

# Get device info
browser.device
browser.device.id
browser.device.name
browser.device.blackberry_playbook?
browser.device.console?
browser.device.ipad?
browser.device.iphone?
browser.device.ipod_touch?
browser.device.kindle?
browser.device.kindle_fire?
browser.device.mobile?
browser.device.nintendo?
browser.device.playstation?
browser.device.ps3?
browser.device.ps4?
browser.device.psp?
browser.device.silk?
browser.device.surface?
browser.device.tablet?
browser.device.tv?
browser.device.vita?
browser.device.wii?
browser.device.wiiu?
browser.device.xbox?
browser.device.xbox_360?
browser.device.xbox_one?

# Get platform info
browser.platform
browser.platform.id
browser.platform.name
browser.platform.version  # e.g. 9 (for iOS9)
browser.platform.adobe_air?
browser.platform.android?
browser.platform.android?(4.2)   # detect Android Jelly Bean 4.2
browser.platform.android_app?     # detect webview in an Android app
browser.platform.android_webview? # alias for android_app?
browser.platform.blackberry?
browser.platform.blackberry?(10) # detect specific BlackBerry version
browser.platform.chrome_os?
browser.platform.firefox_os?
browser.platform.ios?     # detect iOS
browser.platform.ios?(9)  # detect specific iOS version
browser.platform.ios_app?     # detect webview in an iOS app
browser.platform.ios_webview? # alias for ios_app?
browser.platform.linux?
browser.platform.mac?
browser.platform.other?
browser.platform.windows10?
browser.platform.windows7?
browser.platform.windows8?
browser.platform.windows8_1?
browser.platform.windows?
browser.platform.windows_mobile?
browser.platform.windows_phone?
browser.platform.windows_rt?
browser.platform.windows_touchscreen_desktop?
browser.platform.windows_vista?
browser.platform.windows_wow64?
browser.platform.windows_x64?
browser.platform.windows_x64_inclusive?
browser.platform.windows_xp?
```

### Aliases

To add aliases like `mobile?` and `tablet?` to the base object (e.g `browser.mobile?`), require the `browser/aliases` file and extend the Browser::Base object like the following:

```ruby
require "browser/aliases"
Browser::Base.include(Browser::Aliases)

browser = Browser.new("Some user agent")
browser.mobile? #=> false
```

### What's being detected?

- For a list of platform detections, check [lib/browser/platform.rb](https://github.com/fnando/browser/blob/master/lib/browser/platform.rb)
- For a list of device detections, check [lib/browser/device.rb](https://github.com/fnando/browser/blob/master/lib/browser/device.rb)
- For a list of bot detections, check [bots.yml](https://github.com/fnando/browser/blob/master/bots.yml)

### Rails integration

Just add it to the Gemfile.

```ruby
gem "browser"
```

This adds a helper method called `browser`, that inspects your current user agent.

```erb
<% if browser.ie?(6) %>
  <p class="disclaimer">You're running an older IE version. Please update it!</p>
<% end %>
```

If you want to use Browser on your Rails app but don't want to taint your controller, use the following line on your Gemfile:

```ruby
gem "browser", require: "browser/browser"
```

### Accept Language

Parses the accept-language header from an HTTP request and produces an array of language objects sorted by quality.

```ruby
browser = Browser.new("Some User Agent", accept_language: "en-us")

browser.accept_language.class
#=> Array

language = browser.accept_language.first

language.code
#=> "en"

language.region
#=> "US"

language.full
#=> "en-US"

language.quality
#=> 1.0

language.name
#=> "English/United States"
```

Result is always sorted in quality order from highest -> lowest. As per the HTTP spec:

- omitting the quality value implies 1.0.
- quality value equal to zero means that is not accepted by the client.

### Internet Explorer

Internet Explorer has a compatibility view mode that allows newer versions (IE8+) to run as an older version. Browser will always return the navigator version, ignoring the compatibility view version, when defined. If you need to get the engine's version, you have to use `Browser#msie_version` and `Browser#msie_full_version`.

So, let's say an user activates compatibility view in a IE11 browser. This is what you'll get:

```ruby
browser.version
#=> 11

browser.full_version
#=> 11.0

browser.msie_version
#=> 7

browser.msie_full_version
#=> 7.0

browser.compatibility_view?
#=> true
```

This behavior changed in `v1.0.0`; previously there wasn't a way of getting the real browser version.

### Safari

iOS webviews and web apps aren't detect as Safari anymore, so be aware of that if that's your case. You can use a combination of platform and webkit detection to do whatever you want.

```ruby
# iPad's Safari running as web app mode.
browser = Browser.new("Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Mobile/7B405")

browser.safari?
#=> false

browser.webkit?
#=> true

browser.platform.ios?
#=> true
```

### Bots

By default, empty user agents are considered bots. If you want to allow it, please call `Browser::Bot.allow_empty_ua!`.

```ruby
Browser::Bot.allow_empty_ua!
```

### Middleware

You can use the `Browser::Middleware` to redirect user agents.

```ruby
use Browser::Middleware do
  redirect_to "/upgrade" unless ModernBrowser.new(browser).modern?
end
```

If you're using Rails, you can use the route helper methods. Just add something like the following to a initializer file (`config/initializers/browser.rb`).

```ruby
Rails.configuration.middleware.use Browser::Middleware do
  redirect_to "/upgrade" unless ModernBrowser.new(browser).modern?
end
```

Notice that you can have multiple conditionals.

```ruby
Rails.configuration.middleware.use Browser::Middleware do
  modern = ModernBrowser.new(browser).modern?

  next if browser.bot.search_engine?
  redirect_to upgrade_path(browser: "oldie") if browser.ie? && !modern
  redirect_to upgrade_path(browser: "oldfx") if browser.firefox? && !modern
end
```

If you need access to the `Rack::Request` object (e.g. to exclude a path), you can do so with `request`.

```ruby
Rails.configuration.middleware.use Browser::Middleware do
  modern = ModernBrowser.new(browser).modern?
  redirect_to upgrade_path unless modern || request.env["PATH_INFO"] == "/exclude_me"
end
```

### Lightweight Mode

You may want to use just a small subset of Browser's functionalities, and that's perfectly fine. To avoid wasting memory with things you won't use, you can load `browser/lite.rb` and load just what you want.

In your Gemfile, add something like the following:

```ruby
gem "browser", require: "browser/lite"
```

This will only load mainstream browsers (Safari, Chrome, Opera, IE/Edge, Firefox) and meta data for theses browsers. To load other browsers and/or additional detection like platform/device, you must require other files. The following example lists every file you can additionally load:

```ruby
gem "browser",
    require: ["browser/lite",
              "browser/alipay",
              "browser/blackberry",
              "browser/bot",
              "browser/device",
              "browser/electron",
              "browser/facebook",
              "browser/micro_messenger",
              "browser/nokia",
              "browser/otter",
              "browser/phantom_js",
              "browser/platform",
              "browser/proxy",
              "browser/qq",
              "browser/uc_browser",
              "browser/weibo",
              "browser/yandex"]
```

### Migrating to v3

#### Troubleshooting

#### `browser.modern?` and `Browser.modern_rules` were removed

Create a class that wraps the logic you want (e.g. a Rails helper method instantiates a class and passes the browser object to it. An example:

```ruby
class ModernBrowser
  def initialize(browser)
    @browser = browser
  end

  def modern?
    # add your rules here
  end
end

# app/helpers/application_helper.rb
module ApplicationHelper
  def modern_browser?
    ModernBrowser.new(browser).modern?
  end
end
```

If you depend on the `modern` meta name, you can use something similar:

```ruby
module ApplicationHelper
  def modern_browser?; end

  def browser_meta
    meta = browser.meta
    meta << "modern" if modern_browser?
    meta
  end
end
```

#### `NoMethodError: undefined method 'detect_empty_ua!'`

Empty user agents are detected as bots by default. You don't have to call `Browser::Bot.detect_empty_ua!` anymore.

##### `TypeError: no implicit conversion of Hash into String`

The class constructor now has a different signature. Change the instantiation from `Browser.new(options)` to `Browser.new(ua, options)`, where:

- `ua`: must be a string representing the user agent.
- `options`: must be a hash (for now it only accepts the `accept_language` option).

##### `NoMethodError: undefined method 'user_agent'`

`.ua` can now be used to retrieve the full User Agent string.

## Development

### Versioning

This library follows http://semver.org.

### Writing code

Once you've made your great commits (include tests, please):

1. [Fork](http://help.github.com/forking/) browser
2. Create a topic branch - `git checkout -b my_branch`
3. Push to your branch - `git push origin my_branch`
4. Create a pull request
5. That's it!

Please respect the indentation rules and code style.
And use 2 spaces, not tabs. And don't touch the version thing.

## Configuring environment

To configure your environment, you must have Ruby and bundler installed. Then run `bundle install` to install all dependencies.

To run tests, execute `./bin/rake`.

### Adding new features

Before using your time to code a new feature, open a ticket asking if it makes sense and if it's on this project's scope.

Don't forget to add a new entry to `CHANGELOG.md`.

#### Adding a new browser

1. Add the user agent to `test/ua_bots.yml`.
2. Create `browser/your_new_browser.rb`. Use the following code as your template.

```ruby
# frozen_string_literal: true

module Browser
  class Base
    def your_new_browser?(expected_version = nil)
      YourNewBrowser.new(ua).match? && detect_version?(full_version, expected_version)
    end
  end

  class YourNewBrowser < Base
    VERSION_REGEX = %r[YourNewBrowser/([\d.]+)]
    MATCH_REGEX = /YourNewBrowser/

    def id
      :your_new_browser
    end

    def name
      "Your New Browser"
    end

    def full_version
      ua[VERSION_REGEX, 1] || "0.0"
    end

    def match?
      ua =~ MATCH_REGEX
    end
  end
end
```

3. Add `require "browser/your_new_browser"` to `lib/browser.rb`.
4. Add tests for this new functionality.

Don't forget to add a new entry to `CHANGELOG.md`.

#### Adding a new bot

1. Add the user agent to `test/ua_bots.yml`.
2. Add the readable name to `bots.yml`. The key must be something that matches the user agent, in lowercased text.
3. Run tests.

Don't forget to add a new entry to `CHANGELOG.md`.

#### Adding a new search engine

1. Add the user agent to `test/ua_search_engines.yml`.
2. Add the same user agent to `test/ua_bots.yml`.
3. Add the readable name to `search_engines.yml`. The key must be something that matches the user agent, in lowercased text.
4. Run tests.

Don't forget to add a new entry to `CHANGELOG.md`.

#### Wrong browser/platform/device detection

If you know how to fix it, follow the "Writing code" above. Open an issue otherwise; make sure you fill in the issue template with all the required information.

## Maintainer

* Nando Vieira - http://nandovieira.com

## Contributors

* https://github.com/fnando/browser/contributors

## License

(The MIT License)

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
