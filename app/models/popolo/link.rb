module Popolo
  # A URL for a document about a person.
  class Link
    include Mongoid::Document

    embedded_in :person, class_name: 'Popolo::Person'

    # A URL for a document about a person.
    field :url, type: String
    # A note, e.g. 'Wikipedia page'.
    field :note, type: String

    validates_presence_of :url
    # @note Add URL validation to match JSON Schema?
  end
end
