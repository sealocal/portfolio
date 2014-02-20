# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWaveDirect::Uploader

  include CarrierWave::RMagick

  include CarrierWave::MimeTypes
  process :set_content_type

  version :thumb do
    process resize_to_fill: [200, 200]
  end
end
