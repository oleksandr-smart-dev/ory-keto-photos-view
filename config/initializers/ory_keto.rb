Ory::Keto::Client.configure do |config|
  config.base_url = api.env('ORY_KETO_API_BASE_URL') # Replace with your Ory Keto API base URL
  config.api_token = api.env('API_TOKEN') # Replace with your API token for authentication
end