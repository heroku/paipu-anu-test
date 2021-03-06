require "webmock/rspec"

RSpec.configure do |config|
  OmniAuth.config.test_mode = true

  config.include(WebMock::API)

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before type: :webmock do
    WebMock.disable_net_connect!
  end

  config.after type: :webmock do
    WebMock.allow_net_connect!
  end
end
