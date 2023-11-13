module RubyConf
  module Link
    class URL
      attr_reader :url

      def initialize(url:)
        @url = url
      end
    end

    class X
      attr_reader :username

      def initialize(username:)
        @username = username
      end

      def url
        "https://x.com/#{username}"
      end
    end

    Twitter = X

    class GitHub
      attr_reader :username

      def initialize(username:)
        @username = username
      end

      def url
        "https://github.com/#{username}"
      end
    end

    def self.from_json(json)
      type = json[:type]

      case type
      when "base"
        # @type var json: URL::json
        URL.new(url: json[:url])
      when "x"
        # @type var json: X::json
        X.new(username: json[:username])
      when "github"
        # @type var json: GitHub::json
        GitHub.new(username: json[:username])
      end
    end
  end
end
