require "test_helper"
require "browser/rails"
require "sample_app"

class MiddlewareTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Rails.application
  end

  def test_redirect_uses_302
    get "/", {}, {"HTTP_USER_AGENT" => "MSIE 6", "HTTP_ACCEPT" => "text/html"}
    assert_equal 302, last_response.status
  end

  def test_redirect_ie6_to_upgrade_path
    get "/", {}, {"HTTP_USER_AGENT" => "MSIE 6", "HTTP_ACCEPT" => "text/html"}
    follow_redirect!

    assert_equal "UPGRADE: ie6", last_response.body
  end

  def test_redirect_ie7_to_upgrade_path
    get "/", {}, {"HTTP_USER_AGENT" => "MSIE 7", "HTTP_ACCEPT" => "text/html"}
    follow_redirect!

    assert_equal "UPGRADE: ie7", last_response.body
  end

  def test_redirect_ie8_and_404
    get "/", {}, {"HTTP_USER_AGENT" => "MSIE 8", "HTTP_ACCEPT" => "text/html"}
    follow_redirect!

    assert_equal 404, last_response.status
  end

  def test_redirect_ie8_with_wildcard_http_accept
    get "/", {}, {"HTTP_USER_AGENT" => "MSIE 8", "HTTP_ACCEPT" => "*/*"}
    follow_redirect!

    assert_equal 404, last_response.status
  end

  def test_ignores_non_html_requests
    get "/", {}, {"HTTP_USER_AGENT" => "MSIE 6", "HTTP_ACCEPT" => "image/png"}

    assert_equal 200, last_response.status
  end
end
