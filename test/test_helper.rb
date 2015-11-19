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

  def assert_deprecated(message, file, line, &block)
    message = "#{message} (called from #{file}:#{line})"
    out, err = capture_io(&block)
    assert_includes err, message
  end
end
