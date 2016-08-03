require 'sidekiq/web'

Sidekiq.configure_client do |config|
  config.redis = YAML.load_file(File.join(__dir__, 'redis.yml'))[ENV['RACK_ENV']].symbolize_keys
end

map '/imminence' do
  run Sidekiq::Web
end
