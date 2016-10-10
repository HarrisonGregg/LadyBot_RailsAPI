# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!


KEYS = YAML.load_file("#{Rails.root}/config/secrets.yml")