require 'active_support/configurable'
require "random_id/version"

module RandomId

  def self.configure(&block)
    yield @config ||= RandomId::Configuration.new
  end

  # Global settings for RandomId
  def self.config
    @config
  end

  # need a Class for 3.0
  class Configuration #:nodoc:
    include ActiveSupport::Configurable
    config_accessor :default_random_id_length
    config_accessor :column_name

    def param_name
      config.param_name.respond_to?(:call) ? config.param_name.call : config.param_name
    end

    # define param_name writer (copied from AS::Configurable)
    writer, line = 'def param_name=(value); config.param_name = value; end', __LINE__
    singleton_class.class_eval writer, __FILE__, line
    class_eval writer, __FILE__, line
  end

  configure do |config|
    config.default_random_id_length = 6
    config.column_name = :code
  end

end

ActiveSupport.on_load(:active_record) do
  require "random_id/core"
  ::ActiveRecord::Base.send :include, RandomId::Core
end
