# Browser

[![Travis-CI](https://travis-ci.org/fnando/browser.png)](https://travis-ci.org/fnando/browser)
[![CodeClimate](https://codeclimate.com/github/fnando/browser.png)](https://codeclimate.com/github/fnando/browser)
[![Gem Version](https://badge.fury.io/rb/browser.svg)](http://badge.fury.io/rb/browser)

Do some browser detection with Ruby. Includes ActionController integration.

## Installation

```bash
gem install browser
```

## Usage

```ruby
require "rubygems"
require "browser"

browser = Browser.new(:ua => "some string", :accept_language => "en-us")
browser.name            # readable browser name
browser.version         # major version number
browser.full_version
browser.safari?
browser.ios?
browser.app?      # request performed by ios' app webview 
browser.opera?
browser.chrome?
browser.chrome_os?
browser.mobile?
browser.tablet?
browser.console?
browser.firefox?
browser.ie?
browser.ie?(6)          # detect specific IE version
browser.edge?           # Newest MS browser
browser.modern?         # Webkit, Firefox 17+, IE 9+ and Opera 12+
browser.platform        # return :mac, :windows, :linux or :other
browser.ios?            # detect iOS
browser.ios?(9)         # detect specific iOS version
browser.mac?
browser.windows?
browser.windows_x64?
browser.linux?
browser.blackberry?
browser.blackberry?(10) # detect specific BlackBerry version
browser.bot?
browser.search_engine?
browser.phantom_js?
browser.quicktime?
browser.core_media?
browser.silk?
browser.android?
browser.android?(4.2)   # detect Android Jelly Bean 4.2
browser.known?          # has the browser been successfully detected?
browser.meta            # an array with several attributes
browser.to_s            # the meta info joined by space
```

See the [tests](https://github.com/fnando/browser/blob/master/test/browser_test.rb) and [implementation](https://github.com/fnando/browser/blob/master/lib/browser.rb) for more examples.

### What defines a modern browser?

The current rules that define a modern browser are pretty loose:

* Webkit
* IE9+
* Microsoft Edge
* Firefox 17+
* Firefox Tablet 14+
* Opera 12+

You can define your own rules. A rule must be a proc/lambda or any object that implements the method === and accepts the browser object. To redefine all rules, clear the existing rules before adding your own.

```ruby
# Only Chrome Canary is considered modern.
Browser.modern_rules.clear
Browser.modern_rules << -> b { b.chrome? && b.version.to_i >= 37 }
```

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

browser.modern?
#=> false
```

This behavior changed in `v1.0.0`; previously there wasn't a way of getting the real browser version.

### Bots

Browser used to detect empty user agents as bots, but this behaviour has changed. If you want to bring this detection back, you can activate it through the following call:

```ruby
Browser::Bots.detect_empty_ua!
```

### Middleware

You can use the `Browser::Middleware` to redirect user agents.

```ruby
use Browser::Middleware do
  redirect_to "/upgrade" unless browser.modern?
end
```

If you're using Rails, you can use the route helper methods. Just add something like the following to a initializer file (`config/initializers/browser.rb`).

```ruby
Rails.configuration.middleware.use Browser::Middleware do
  redirect_to upgrade_path unless browser.modern?
end
```

Notice that you can have multiple conditionals.

```ruby
Rails.configuration.middleware.use Browser::Middleware do
  next if browser.search_engine?
  redirect_to upgrade_path(browser: "oldie") if browser.ie? && !browser.modern?
  redirect_to upgrade_path(browser: "oldfx") if browser.firefox? && !browser.modern?
end
```

If you need acccess to the `Rack::Request` object (e.g. to exclude a path), you can do so with `request`.
```ruby
Rails.configuration.middleware.use Browser::Middleware do
  redirect_to upgrade_path unless browser.modern? || request.env['PATH_INFO'] == '/exclude_me'
end
```

## Maintainer

* Nando Vieira - http://nandovieira.com.br

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
