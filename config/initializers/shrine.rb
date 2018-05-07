require "shrine/storage/s3"

s3_options = {
    access_key_id:     ENV.fetch('AWS_ACCESS_KEY'),
    secret_access_key: ENV.fetch('AWS_SECRET_KEY'),
    region:            ENV.fetch('AWS_REGION'),
    bucket:            ENV.fetch('AWS_BUCKET')
}

Shrine.storages = {
    cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options),
    store: Shrine::Storage::S3.new(**s3_options),
}

# URL options for CloudFront CDN
url_options = {
  public: true,
  host: ENV.fetch('AWS_HOST')
}

# Clearing cache in S3 storage
s3 = Shrine.storages[:cache]
s3.clear! { |object| object.last_modified < Time.now - 4*7*24*60*60 } # delete files older than 4 week