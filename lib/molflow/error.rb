module Molflow
  class Error < StandardError; end

  class BaseConfigurationLoadError < LoadError
    def initialize(path)
      message = if File.exist?(path)
                  "Sorry, but the configuration file has an incorrect format. Try `molflow install`.\nPath: #{path}"
                else
                  "Sorry, but the configuration file is missing on this path: #{path}. Try `molflow install`"
                end

      super(message)
    end
  end

  class MissingKey < Error
    def initialize(key)
      super("Missing required configuration key: #{key.inspect}")
    end
  end
end
