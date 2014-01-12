require 'rspec'
require_relative '../lib/last_ruby_fm'

LastRubyFm.api_key = ENV['last_fm_api_key']

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  config.order = 'random'
end
