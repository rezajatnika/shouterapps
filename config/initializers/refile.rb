require 'refile/backend/s3'

aws = {
  access_key_id:     ENV['aws_access_key_id'],
  secret_access_key: ENV['aws_secret_access_key'],
  bucket:            ENV['aws_bucket']
}

Refile.cache = Refile::Backend::S3.new(prefix: 'cache', **aws)
Refile.store = Refile::Backend::S3.new(prefix: 'store', **aws)
