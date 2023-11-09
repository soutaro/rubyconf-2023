module RubyConf
  module Link
    class Base
      attr_reader :url

      def initialize(url:)
        @url = url
      end
    end

    class X < Base
      attr_reader :username

      def initialize(username:)
        @username = username
        super(url: "https://x.com/#{username}")
      end
    end

    Twitter = X

    class GitHub < Base
      attr_reader :username

      def initialize(username:)
        @username = username
        super(url: "https://github.com/#{username}")
      end
    end

    def self.from_json(json)
      type = json[:type]

      case type
      when "base"
        # @type var json: Base::json
        Base.new(url: json[:url])
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
