require 'spec_helper'
require 'molflow/cli/install'

describe Molflow::CLI::Install do
  subject(:install) { Molflow::CLI::Install }

  it 'generate base configuration file' do
    path = File.expand_path('../../tmp/.molflow', __FILE__)
    install.start(['-p', path].compact)

    expect(File.exist?(path)).to be true
    expect(ENV['MOLFLOW_BASE_CONFIG']).to eq path
  end
end
