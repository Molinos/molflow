require 'spec_helper'
require 'molflow/cli/jira'

describe Molflow::CLI::Jira do
  subject(:jira) { Molflow::CLI::Jira }

  it '#client: get jira client with base config' do
    jira_client = jira.client
    expect(jira_client.is_a?(JIRA::Client)).to be true
  end
end
