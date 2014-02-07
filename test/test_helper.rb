ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../../Gemfile", __FILE__)
require "bundler/setup"
require "test/unit"
require "browser"
require "turn"
require "turn/reporter"

Turn.config.format = :dot
$RUBY_IGNORE_CALLERS += [%r[/gems/], %r[minitest/unit.rb]]
