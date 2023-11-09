require "optparse"

module RubyConf
  class CLI
    attr_reader :argv
    attr_accessor :stdout, :stderr

    def initialize(argv)
      @argv = argv
      @stdout = $stderr
      @stdout = $stdout
    end

    KNOWN_COMMANDS = %w(help speakers)

    DATA_PATH = Pathname(
      __dir__ #: String
    ) + "../../data.yaml"

    def start
      command = argv.shift

      if command && KNOWN_COMMANDS.include?(command)
        send("run_#{command}")
      else
        run_help
      end
    end

    def run_help
      stdout.puts "usage: rubyconf <command> [<args>]"
      stdout.puts
      stdout.puts "Available commends: #{KNOWN_COMMANDS.join(", ")}"
      0
    end

    def run_speakers
      query = argv.shift

      conference = Conference.load(DATA_PATH)

      conference.speakers.each do |speaker|
        if query
          next unless speaker.match?(query)
        end

        if speaker.tagline.empty?
          stdout.puts speaker.name
        else
          stdout.puts "#{speaker.name} -- #{speaker.tagline}"
        end
        stdout.puts

        unless speaker.description.empty?
          speaker.description.each_line do |line|
            stdout.puts "  #{line}"
          end
          stdout.puts
        end

        unless speaker.links.empty?
          speaker.links.each do |link|
            case link
            when Link::X
              puts "  - X: @#{link.username}"
            when Link::GitHub
              puts "  - GitHub: @#{link.username}"
            when Link::Base
              puts "  - #{link.url}"
            end
          end
          stdout.puts
        end
      end

      0
    end
  end
end
