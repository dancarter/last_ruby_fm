require 'rspec'
require 'vcr'
require_relative '../lib/last_ruby_fm'

LastRubyFm.api_key = ENV['last_fm_api_key']

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
  c.default_cassette_options = { :record => :new_episodes }
  c.filter_sensitive_data( '<LASTFM API KEY>' ) { LastRubyFm.api_key }
end

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  config.order = 'random'
end
