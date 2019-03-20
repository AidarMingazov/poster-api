require "rspec_api_documentation"
require "rspec_api_documentation/dsl"

RspecApiDocumentation.configure do |config|
  config.api_name = "Props api"
  config.format = %i[markdown JSON]
  config.docs_dir = Rails.root.join("doc", "api")
  config.request_body_formatter = :json
end
