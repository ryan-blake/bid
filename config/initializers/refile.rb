
require "refile/s3"

aws = {
  access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID'),
  secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
  bucket: ENV.fetch('S3_BUCKET_NAME'),
  region: ENV.fetch('region_id')
}
Refile.cache = Refile::S3.new(prefix: "cache", **aws)
Refile.store = Refile::S3.new(prefix: "store", **aws)
