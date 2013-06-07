# Browser

![Travis-CI](https://travis-ci.org/fnando/browser.png)

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
browser.safari?
browser.opera?
browser.chrome?
browser.mobile?
browser.tablet?
browser.firefox?
browser.ie?
browser.ie6?        # this goes up to 9
browser.capable?    # supports some CSS 3
browser.platform    # return :mac, :windows, :linux or :other
browser.mac?
browser.windows?
browser.linux?
browser.blackberry?
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
