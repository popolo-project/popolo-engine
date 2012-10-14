module Popolo
  # A source of information.
  class Source
    include Mongoid::Document

    embedded_in :sourceable, polymorphic: true

    # A human-readable unique identifier for the source, e.g. "news.google.ca".
    field :name, type: String
    # The source's URL.
    field :url, type: String
    # The source's ETag.
    field :etag, type: String
    # The source's last modified timestamp.
    field :last_modified, type: Time
    # Any additional information to store about the source.
    field :extra, type: Hash

    validates_presence_of :name, :last_modified
  end
end
