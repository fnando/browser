# frozen_string_literal: true

require "test_helper"
require "browser/rails"
require "sample_app"

class RailsTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Rails.application
  end

  test "renders page" do
    get "/home", {}, "HTTP_USER_AGENT" => Browser["CHROME"],
                     "HTTP_ACCEPT" => "text/html",
                     "HTTP_ACCEPT_LANGUAGE" => "en-US;q=0.8"

    assert_equal 200, last_response.status
    assert_equal "Chrome:en-US", last_response.body
  end

  test "renders json" do
    get "/api/pages", {}, "HTTP_USER_AGENT" => Browser["COMMONCRAWL"],
                          "HTTP_ACCEPT" => "application/json",
                          "HTTP_ACCEPT_LANGUAGE" => "en-US;q=0.8"

    assert_equal 200, last_response.status
    assert_equal true, JSON.parse(last_response.body)["isBot"]
    assert_equal "en-US", JSON.parse(last_response.body)["acceptLanguages"][0]
  end
end
