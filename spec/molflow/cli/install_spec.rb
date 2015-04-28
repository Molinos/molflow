require 'spec_helper'
require 'molflow/commands/install'

describe Molflow::Commands::Install do
  subject(:install) { Molflow::Commands::Install }

  it '#install: generate base configuration file' do
    install.any_instance.stubs(:ask).returns(true)

    path = "#{Molflow.root}/tmp/.molflow"
    install.start(['-p', path].compact)

    expect(File.exist?(path)).to be true
  end
end
