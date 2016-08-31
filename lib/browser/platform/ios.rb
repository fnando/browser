# frozen_string_literal: true
module Browser
  class Platform
    class IOS < Base
      MATCHER = /(iPhone|iPad|iPod)/
      VERSION_MATCHER = /OS ((?<major>\d)_(?<minor>\d)_?(?<patch>\d)?)/

      def version
        matches = VERSION_MATCHER.match(ua)
        if matches
          versions = [matches[:major]]
          if matches[:patch]
            versions.push(matches[:minor], matches[:patch])
          else
            versions.push(matches[:minor]) unless matches[:minor] == "0"
          end
          versions.join(".")
        else
          "0"
        end
      end

      def name
        "iOS (#{device})"
      end

      def id
        :ios
      end

      def match?
        ua =~ MATCHER
      end

      def device
        ua[MATCHER, 1]
      end
    end
  end
end
