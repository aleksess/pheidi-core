require "pheidi/version"
require "pheidi/engine"
require "pheidi/configuration"

module Pheidi
  # Your code goes here...
  class << self
    attr_accessor :configuration
    def configure
     self.configuration ||= Configuration.new
     yield(configuration)
    end

    def config
      self.configuration ||= Configuration.new
    end
  end
end
