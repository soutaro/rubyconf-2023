module RubyConf
  class Speaker
    attr_reader :name, :tagline, :description, :links

    def initialize(name:, tagline:, description:, links:)
      @name = name
      @tagline = tagline
      @description = description
      @links = links
    end

    def self.from_json(json)
      Speaker.new(
        name: json[:name],
        tagline: json[:tagline],
        description: json[:description],
        links: json[:links].map {|link| Link.from_json(link) }
      )
    end

    def match?(query)
      regexp = Regexp.compile(Regexp.escape(query), Regexp::IGNORECASE)
      name.match?(regexp) || tagline.match?(regexp) || tagline.match?(description)
    end
  end
end
