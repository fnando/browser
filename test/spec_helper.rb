ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../../Gemfile", __FILE__)
require "bundler/setup"
require "minitest/autorun"
require "minitest/unit"
require "browser"
require "yaml"

$ua = YAML.load_file("./test/ua.yml")
