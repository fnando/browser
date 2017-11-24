# frozen_string_literal: true

require "browser/version"
require "browser/accept_language"
require "browser/detect_version"
require "browser/base"
require "browser/chrome"
require "browser/firefox"
require "browser/opera"
require "browser/safari"
require "browser/generic"
require "browser/meta"

require "browser/internet_explorer"
require "browser/edge"

require "browser/browser"

require "browser/rails" if defined?(::Rails)
