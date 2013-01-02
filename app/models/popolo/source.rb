module Popolo
  # A source of information.
  #
  # Turtle document:
  #
  #     <http://example.com/sources/67cc67093475061e3d95369d.ttl>
  #       rdfs:label "news.google.com";
  #       dcterms:modified "2012-01-01T00:00:00Z"^^xsd:dateTime .
  #
  # @see http://dublincore.org/documents/dcmi-terms/
  # @todo Add the ETag to the Turtle document.
  class Source
    include Mongoid::Document

    embedded_in :sourceable, polymorphic: true

    # A human-readable unique identifier for the source, e.g. "news.google.com".
    field :name, type: String
    # The source's ETag.
    field :etag, type: String
    # The source's last modified timestamp.
    field :last_modified, type: Time
    # Any additional information about the source.
    field :extra, type: Hash

    validates_presence_of :name, :last_modified
  end
end
