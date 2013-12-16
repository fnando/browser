class Browser
  module Bots
    # This initial list of bots was humbly borrowed from the split (https://github.com/andrew/split)
    # gem.
    BOTS = {
      # Indexers
      'AdsBot-Google'        => 'Google Adwords',
      'alexa'                => 'Alexa Crawler',
      'Baidu'                => 'Chinese search engine',
      'Baiduspider'          => 'Chinese search engine',
      'bingbot'              => 'Microsoft bing bot',
      'Butterfly'            => 'Topsy Labs',
      'Crowsnest'            => 'crowsnest.tv news portal bot',
      'EvriNid'              => 'Evri bot',
      'FeedBurner'           => 'RSS bot',
      'Genieo'               => 'Genieo Web filter bot',
      'Gigabot'              => 'Gigabot spider',
      'Googlebot'            => 'Google spider',
      'Google Web Preview'   => 'Google Instant Previews crawler',
      'Kimengi'              => 'nineconnections.com bot',
      'MJ12bot'              => 'Majestic-12 spider',
      'Mediapartners-Google' => 'Google Adsense bot',
      'MetaURI'              => 'URI meta information extractor bot',
      'MFE_expand'           => 'Mcafee spider',
      'msnbot'               => 'Microsoft bot',
      'Netvibes'             => 'Personalized dashboard bot',
      'Nutch'                => 'Apache search spider',
      'rogerbot'             => 'SeoMoz spider',
      'PaperLiBot'           => 'PaperLi content curation service',
      'SemrushBot'           => 'SEO analysis bot',
      'Slurp'                => 'Yahoo spider',
      'Sogou'                => 'Chinese search engine',
      'spider'               => 'generic web spider',
      'Twikle'               => 'Social web search bot',
      'UnwindFetchor'        => 'Gnip crawler',
      'WordPress'            => 'WordPress spider',
      'YandexBot'            => 'Yandex spider',
      'ZIBB'                 => 'ZIBB spider',

      # HTTP libraries
      'Apache-HttpClient' => 'Java http library',
      'AppEngine-Google' => 'Google App Engine',
      'AsyncHttpClient' => 'Java http and WebSocket client library',
      'curl' => 'curl unix CLI http client',
      'ColdFusion' => 'ColdFusion http library',
      'EventMachine HttpClient' => 'Ruby http library',
      'Go http package' => 'Go http library',
      'Jakarta Commons' => 'Jakarta Commons HttpClient',
      'Java' => 'Generic Java http library',
      'libwww-perl' => 'Perl client-server library loved by script kids',
      'lwp-trivial' => 'Another Perl library loved by script kids',
      'python-requests' => 'Python http library',
      'Python-urllib' => 'Python http library',
      'PycURL' => 'Python http library',
      'Test Certificate Info' => 'C http library?',
      'VB Project' => 'Visual Basic',
      'Wget' => 'wget unix CLI http client',

      # URL expanders / previewers
      'awe.sm' => 'Awe.sm URL expander',
      'bitlybot' => 'bit.ly bot',
      'bot@linkfluence.net' => 'Linkfluence bot',
      'facebookexternalhit' => 'facebook bot',
      'Feedfetcher-Google' => 'Google Feedfetcher',
      'https://developers.google.com/+/web/snippet' => 'Google+ Snippet Fetcher',
      'InAGist' => 'URL resolver',
      'JS-Kit' => 'URL resolver',
      'LongURL' => 'URL expander service',
      'newsme' => 'Link analyzer',
      'NING' => 'NING - Yet Another Twitter Swarmer',
      'redditbot' => 'Reddit Bot',
      'ShortLinkTranslate' => 'Link shortener',
      'TweetmemeBot' => 'TweetMeMe Crawler',
      'Twitterbot' => 'Twitter URL expander',
      'UnwindFetch' => 'Gnip URL expander',
      'vkShare' => 'VKontake Sharer',
      'zelist.ro' => 'feed parser',

      # Uptime monitoring
      'check_http' => 'Nagios monitor',
      'NewRelicPinger' => 'NewRelic monitor',
      'Panopta' => 'Monitoring service',
      'Pingdom' => 'Pingdom monitoring',
      'SiteUptime' => 'Site monitoring services',

      # Load testers
      'ApacheBench' => 'ApacheBench (ab)',
      'Siege'       => 'Joe Dog Siege',

      # ???
      'DigitalPersona Fingerprint Software' => 'HP Fingerprint scanner',
      'ShowyouBot' => 'Showyou iOS app spider',
      'ZyBorg' => 'Zyborg? Hmmm....',
    }

    def bot?
      ua.empty? || BOTS.any? {|key, description| ua.include?(key) }
    end
  end
end
