require "lavatar/version"
require "lavatar/configuration"
require "lavatar/helpers"

module Lavatar
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end

ActiveSupport.on_load :action_view do
  include Lavatar::Helpers
end
