module Popolo
  # An occurrence, eg an action mentioning or performed by an agent.
  #
  # Turtle document:
  #
  #     <http://example.com/events/57cc67093475061e3d95369d.ttl>
  #       a cnt:ContentAsText;
  #       cnt:characterEncoding "UTF-8";
  #       cnt:chars "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ...";
  #       dcterms:format "text/plain";
  #       dcterms:isFormatOf <http://example.org/news/123.html>;
  #       dcterms:issued "2012-01-01T00:00:00Z"^^xsd:dateTime;
  #       dcterms:created "2012-01-01T00:00:00Z"^^xsd:dateTime;
  #       dcterms:modified "2012-01-01T00:00:00Z"^^xsd:dateTime .
  #
  # @see http://www.w3.org/TR/Content-in-RDF10/
  # @see http://dublincore.org/documents/dcmi-terms/
  class Event
    include Mongoid::Document
    include Mongoid::Timestamps

    # The identifier of the source of information for the event.
    field :source, type: String
    # The URL to which the event may be attributed.
    field :url, type: String
    # The event's content.
    field :body, type: String
    # The time of the event or of its publication.
    field :issued_at, type: Time
    # The records related to the event.
    field :related, type: Hash
    # Any additional information about the event.
    field :extra, type: Hash

    index 'related.area' => 1, source: 1, issued_at: -1
    index 'related.membership' => 1, source: 1, issued_at: -1
    index 'related.organization' => 1, source: 1, issued_at: -1
    index 'related.organizational_unit' => 1, source: 1, issued_at: -1

    validates_presence_of :source, :url, :body, :issued_at
  end
end
