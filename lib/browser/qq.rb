# frozen_string_literal: true

module Browser
  class QQ < Base
    MATCH_REGEX = /QQ/i
    MQQ_VERSION_REGEX = %r[(?:Mobile MQQBrowser)/([\d.]+)]i
    QQ_LITE_VERSION_REGEX = %r[(?:QQBrowserLite)/([\d.]+)]i
    QQ_VERSION_REGEX = %r[(?:QQ(?:Browser)?)/([\d.]+)]i

    def id
      :qq
    end

    def name
      "QQ Browser"
    end

    def full_version
      ua[MQQ_VERSION_REGEX, 1] ||
        ua[QQ_LITE_VERSION_REGEX, 1] ||
        ua[QQ_VERSION_REGEX, 1] ||
        DEFAULT_FULL_VERSION
    end

    def match?
      ua =~ MATCH_REGEX
    end
  end

  matchers.unshift(QQ)
end
