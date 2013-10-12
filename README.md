# Browser

[![Travis-CI](https://travis-ci.org/fnando/browser.png)](https://travis-ci.org/fnando/browser)
[![CodeClimate](https://codeclimate.com/github/fnando/browser.png)](https://codeclimate.com/github/fnando/browser)

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
browser.name        # readable browser name
browser.version
browser.safari?
browser.opera?
browser.chrome?
browser.mobile?
browser.tablet?
browser.firefox?
browser.ie?
browser.ie6?        # this goes up to 10
browser.modern?     # Webkit, Firefox 17+, IE 9+ and Opera 12+
browser.platform    # return :mac, :windows, :linux or :other
browser.mac?
browser.windows?
browser.linux?
browser.blackberry?
browser.bot?
browser.meta        # an array with several attributes
browser.to_s        # the meta info joined by space
```

See the [tests](https://github.com/fnando/browser/blob/master/test/browser_test.rb) and [implementation](https://github.com/fnando/browser/blob/master/lib/browser.rb) for more examples.

### Rails integration

Just add it to the Gemfile.

```ruby
gem "browser"
```

This adds a helper method called `browser`, that inspects your current user agent.

```erb
<% if browser.ie6? %>
  <p class="disclaimer">You're running an older IE version. Please update it!</p>
<% end %>
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
  redirect_to upgrade_path(browser: "oldie") if browser.ie? && !browser.modern?
  redirect_to upgrade_path(browser: "oldfx") if browser.firefox? && !browser.modern?
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
