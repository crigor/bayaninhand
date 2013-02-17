api_key = YAML.load_file('config/settings.yml')['airbrakex']

if api_key.nil? || api_key.blank?
  Rails.logger.warn "[APP] Airbrake api key doesn't exist"
end

Airbrake.configure do |config|
  config.api_key = api_key
end
