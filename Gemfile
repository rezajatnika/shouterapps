source 'https://rubygems.org'

ruby '2.2.1'

# Default gems
gem 'rails',        '4.2.1'
gem 'sqlite3',      '1.3.10'
gem 'bcrypt',       '3.1.10'
gem 'faker'
gem 'kaminari'

# Assets gems
gem 'sass-rails',   '5.0.3'
gem 'uglifier',     '2.7.1'
gem 'coffee-rails', '4.1.0'
gem 'jquery-rails', '4.0.3'
gem 'turbolinks',   '2.5.3'
gem 'jbuilder',     '2.2.13'
gem 'sdoc',         '0.4.1', group: :doc

# File uploads and processing
gem 'mini_magick', '4.2.3'
gem 'refile',      '0.5.4', require: ['refile/rails', 'refile/image_processing']
gem 'aws-sdk',     '< 2'

# Development gems
group :development, :test do
  gem 'byebug',      '4.0.5'
  gem 'web-console', '2.1.2'
  gem 'spring',      '1.3.5'
  gem 'figaro'
  gem 'quiet_assets'
end

# Test gems
group :test do
  gem 'minitest-reporters', '1.0.12'
  gem 'mini_backtrace',     '0.1.3'
  gem 'guard-minitest',     '2.4.4'
  gem 'guard',              '2.12.5'
end

# Production gems
group :production do
  gem 'pg'
  gem 'rails_12factor'
  gem 'puma'
end
