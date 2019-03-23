class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    "default-avatar.png"
  end

  def extension_whitelist
    %w[jpg jpeg png]
  end

  process resize_to_fit: [100, 100]
end
