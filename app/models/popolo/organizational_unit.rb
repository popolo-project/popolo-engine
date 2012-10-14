module Popolo
  # An organization that only has full recognition in the context of a larger
  # organization. An organizational unit is not a legal person in its own right.
  #
  # Turtle document:
  #
  #     <http://example.com/organizational_units/27cc67093475061e3d95369d.ttl>
  #       a org:OrganizationalUnit;
  #       skos:prefLabel "Marketing";
  #       org:classification [
  #         a skos:Concept;
  #         skos:prefLabel "Department";
  #       ];
  #       org:unitOf <http://example.com/organizations/17cc67093475061e3d95369d.ttl>;
  #       rdfs:seeAlso <http://example.com/organizational_units/27cc67093475061e3d95369d>;
  #       dcterms:created "2012-01-01T00:00:00Z"^^xsd:dateTime;
  #       dcterms:modified "2012-01-01T00:00:00Z"^^xsd:dateTime .
  #
  # @see http://www.w3.org/TR/vocab-org/
  # @see http://www.w3.org/TR/skos-reference/
  # @see http://dublincore.org/documents/dcmi-terms/
  class OrganizationalUnit < Organization
  end
end
