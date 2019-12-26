# frozen_string_literal: true

require "test_helper"

class ArchivebotTest < Minitest::Test
  test "detects archivebot at bot" do
    browser = Browser.new(Browser["ARCHIVEBOT"])

    assert browser.bot?
  end
end
