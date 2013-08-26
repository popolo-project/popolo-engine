module Popolo
  # A URL.
  class Link
    include Mongoid::Document

    embedded_in :linkable, polymorphic: true

    # A URL.
    field :url, type: String
    # A note, e.g. 'Wikipedia page'.
    field :note, type: String

    validates_presence_of :url
    # @note Add URL validation to match JSON Schema?
  end
end
