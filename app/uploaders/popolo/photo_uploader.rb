# coding: utf-8
require 'carrierwave/processing/mime_types'

module Popolo
  class PhotoUploader < CarrierWave::Uploader::Base
    include CarrierWave::MimeTypes

    # Include RMagick or MiniMagick support:
    include CarrierWave::RMagick
    # include CarrierWave::MiniMagick

    # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
    include Sprockets::Helpers::RailsHelper
    include Sprockets::Helpers::IsolatedHelper

    # Choose what kind of storage to use for this uploader:
    # storage :fog

    # Override the directory where uploaded files will be stored.
    # This is a sensible default for uploaders that are meant to be mounted:
    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end

    # Provide a default URL as a default if there hasn't been a file uploaded:
    # def default_url
    #   # For Rails 3.1+ asset pipeline compatibility:
    #   # asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
    #
    #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
    # end
    def default_url
      case version_name
      when :large
        'http://placehold.it/90x120'
      when :thumb
        'http://placehold.it/48x48'
      end
    end

    # Process files as they are uploaded:
    # process :scale => [200, 300]
    #
    # def scale(width, height)
    #   # do something
    # end

    # Create different versions of your uploaded files:
    # version :thumb do
    #   process :scale => [50, 50]
    # end

    version :large do
      process :resize_to_fill => [90, 120]
    end
    version :thumb do
      process :resize_to_fill => [48, 48]
    end

    # Add a white list of extensions which are allowed to be uploaded.
    # For images you might use something like this:
    def extension_white_list
      %w(jpg jpeg gif png)
    end

    # Override the filename of the uploaded files:
    # Avoid using model.id or version_name here, see uploader/store.rb for details.
    # def filename
    #   "something.jpg" if original_filename
    # end
    def filename
      "#{model.slug}.jpg" if original_filename
    end
  end
end
