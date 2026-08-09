require 'sinatra'
require 'json'

set :port, ENV['PORT'] || 8080
set :bind, '0.0.0.0'
# Allow requests from any host (required for Sinatra 4.0+)
set :host_authorization, permitted_hosts: []

START_TIME = Time.now

get '/' do
  content_type :json
  {
    message: 'Welcome to your Ruby API',
    version: '1.0.0',
    endpoints: {
      health: '/health',
      root: '/'
    }
  }.to_json
end

get '/health' do
  content_type :json
  {
    status: 'healthy',
    timestamp: Time.now.utc.iso8601,
    uptime: Time.now - START_TIME
  }.to_json
end
