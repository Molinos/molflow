module Molflow
  class Application < Rake::Application
    def initialize
      super
      @rakefiles = %w{Capfile} << rakefile
    end

    def run
      Rake.application = self
      super
    end

    # allows the `cap install` task to load without a capfile
    def rakefile
      File.expand_path(File.join(File.dirname(__FILE__),'..','Rakefile'))
    end
  end
end
