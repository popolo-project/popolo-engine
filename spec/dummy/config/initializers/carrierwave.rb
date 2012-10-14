CarrierWave.configure do |config|
  config.root = 'public'
  config.cache_dir = 'uploads'
  config.storage = :file
end
