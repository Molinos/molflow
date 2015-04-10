module Molflow
  class CLI < Thor
    class Task
      attr_reader :options

      def self.run(options = {})
        new(options).run
      end

      def initialize(options = {})
        @options = options
      end
    end
  end
end