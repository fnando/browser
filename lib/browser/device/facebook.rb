# frozen_string_literal: true
module Browser
  class Device
    class Facebook < Base
      
      def initialize(ua)
        super(ua)

        if match?
          @meta = Hash[ (ua =~ %r(\[(FBAN/.*)\]) && $1.split(';') ).map{ |i| i.split( '/' ) } ]
        end
      end

      def id
        case @meta["FBMD"]
        when "iPhone"
          :iphone
        when "iPad"
          :ipad
        when "iPod touch"
          :ipod
        else
          ( @meta["FBID"] || "unknown" ).to_sym
        end
      end

      def name
        @meta["FBMD"]
      end

      def match?
        ua =~ /\bFBMD\//
      end
    end
  end
end
