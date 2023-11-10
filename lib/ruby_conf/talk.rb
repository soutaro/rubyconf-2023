module RubyConf
  class Talk
    attr_reader :title, :starts_at, :duration, :room, :description, :speakers

    def initialize(title:, starts_at:, duration:, room:, description:, speakers:)
      @title = title
      @starts_at = starts_at
      @duration = duration
      @room = room
      @description = description
      @speakers = speakers
    end

    def self.from_json(json)
      speakers = json[:speakers].map {|name| yield name }
      starts_at = json[:starts_at]

      starts_at = Time.iso8601(starts_at)

      Talk.new(
        title: json[:title],
        starts_at: starts_at,
        duration: json[:duration],
        room: RubyConf.room(json[:room]),
        description: json[:description],
        speakers: speakers
      )
    end

    def match?(string)
      regexp = Regexp.compile(Regexp.escape(string), Regexp::IGNORECASE)
      title.match?(regexp) || description.match?(regexp)
    end
  end
end
