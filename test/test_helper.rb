ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../../Gemfile", __FILE__)
require "bundler/setup"
require "minitest/autorun"
require "minitest/utils"
require "browser"
require "yaml"

$ua = YAML.load_file("./test/ua.yml")

class Minitest::Test
  setup do
    Browser::Bots.instance_variable_set("@detect_empty_ua", false)
  end
end
