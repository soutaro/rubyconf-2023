require "yaml"
require "pathname"
require "time"

require "ruby_conf/conference"
require "ruby_conf/talk"
require "ruby_conf/speaker"
require "ruby_conf/link"
require "ruby_conf/workshop"

module RubyConf
  def self.room(source)
    table = {
      :BALLROOM_A => :BALLROOM_A,
      :BALLROOM_B => :BALLROOM_B,
      :BALLROOM_C => :BALLROOM_C,
      "Ballroom A" => :BALLROOM_A,
      "Ballroom B" => :BALLROOM_B,
      "Ballroom C" => :BALLROOM_C
    } #: Hash[String | Symbol, room]

    table[source] or raise "Unknown room: `#{source}`"
  end
end
