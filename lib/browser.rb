# frozen_string_literal: true

require "set"

require "browser/accept_language"
require "browser/detect_version"
require "browser/base"

require "browser/alipay"
require "browser/blackberry"
require "browser/bot"
require "browser/chrome"
require "browser/device"

require "browser/internet_explorer"
require "browser/edge"

require "browser/electron"
require "browser/facebook"
require "browser/firefox"
require "browser/generic"
require "browser/matchers"
require "browser/meta"
require "browser/micro_messenger"
require "browser/nokia"
require "browser/opera"
require "browser/otter"
require "browser/phantom_js"
require "browser/platform"
require "browser/qq"
require "browser/safari"
require "browser/uc_browser"
require "browser/version"
require "browser/weibo"

require "browser/browser"

require "browser/middleware"
require "browser/rails" if defined?(::Rails)
