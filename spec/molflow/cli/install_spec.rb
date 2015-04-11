require 'spec_helper'
require 'molflow/cli/install'

describe Molflow::CLI::Install do
  subject(:install) { Molflow::CLI::Install }

  it '#install: generate base configuration file' do
    path = File.expand_path('../../tmp/.molflow', __FILE__)
    install.start(['-p', path].compact)

    expect(File.exist?(path)).to be true
  end
end
