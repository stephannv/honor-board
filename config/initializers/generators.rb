Rails.application.config.generators do |g|
  g.factory_bot suffix: 'factory'
  g.orm :active_record, primary_key_type: :uuid
end
