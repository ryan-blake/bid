require "shrine"
require "shrine/storage/s3"

  s3_options = {
    access_key_id:     ENV.fetch("AWS_ACCESS_KEY_ID"),
    secret_access_key: ENV.fetch("AWS_SECRET_ACCESS_KEY"),
    region:            ENV.fetch("REGION_ID"),
    bucket:            ENV.fetch("S3_BUCKET_NAME"),
  }

Shrine.storages = {
  cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options),
  store: Shrine::Storage::S3.new(prefix: "store", **s3_options),
}

Shrine.plugin :activerecord
Shrine.plugin :logging, logger: Rails.logger
Shrine.plugin :direct_upload, presign: true
Shrine.plugin :backgrounding

Shrine::Attacher.promote { |data| PromoteJob.perform_async(data) }
Shrine::Attacher.delete { |data| DeleteJob.perform_async(data) }
