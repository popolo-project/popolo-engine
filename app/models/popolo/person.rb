module Popolo
  # A person.
  #
  # Turtle document:
  #
  #     <http://example.com/people/47cc67093475061e3d95369d.ttl>
  #       a v:Individual;
  #       v:fn "Mr. John Q. Public Esq.";
  #       v:hasName [
  #         v:givenName "John";
  #         v:familyName "Public";
  #         v:additionalName "Quinlan";
  #         v:honorificPrefix "Mr.";
  #         v:honorificSuffix "Esq."
  #       ];
  #       v:email <jqpublic@xyz.example.com>;
  #       v:gender v:Male;
  #       v:photo <http://www.example.com/pub/photos/jqpublic.gif>;
  #       bio:olb "A hypothetical member of society deemed a 'common man'";
  #       bio:biography "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ...";
  #       v:url "http://example.com/people/47cc67093475061e3d95369d";
  #       v:url "http://twitter.com/ev";
  #       v:url "http://en.wikipedia.org/wiki/John_Q._Public"@en;
  #       v:url "http://fr.wikipedia.org/wiki/Homme_de_la_rue"@fr;
  #       dcterms:created "2012-01-01T00:00:00Z"^^xsd:dateTime;
  #       dcterms:modified "2012-01-01T00:00:00Z"^^xsd:dateTime .
  #
  # @note FOAF has no property for additional names or honorific suffixes.
  # @note Schema.org can't represent alternative names.
  # @see http://vocab.org/bio/0.1/.html
  # @see http://dublincore.org/documents/dcmi-terms/
  # @see http://xmlns.com/foaf/spec/
  # @see http://schema.org/Person
  class Person
    include Mongoid::Document
    include Mongoid::Timestamps

    has_many :memberships
    embeds_many :sources, as: :sourceable
    has_and_belongs_to_many :events, index: true

    mount_uploader :photo, PhotoUploader

    # The person's formatted name.
    field :name, type: String
    # A lowercase identifier composed of letters, numbers and dashes.
    field :slug, type: String

    # The person's given name.
    field :given_name, type: String
    # The person's family name.
    field :family_name, type: String
    # An additional name, eg a middle name.
    field :additional_name, type: String
    # An honorific prefix before the person's name, eg "Dr.".
    field :honorific_prefix, type: String
    # An honorific suffix after the person's name, eg "Jr.".
    field :honorific_suffix, type: String

    # The person's email address.
    field :email, type: String
    # The person's gender, eg "male", "female" or another value.
    field :gender, type: String
    # The person's one-line biography.
    field :summary, type: String, localize: true
    # The person's extended biography.
    field :biography, type: String, localize: true

    # Accounts this person has on other websites, eg Twitter.
    field :accounts, type: Hash
    # Links to other pages about this person, eg Wikipedia.
    field :links, type: Hash, localize: true

    validates_presence_of :name, :slug

    index({slug: 1}, unique: true)

    before_validation :set_slug

    def self.find_by_slug(slug)
      where(slug: slug).first || find(slug)
    end

  private

    # @note Leave it to the content manager to choose a slug in case of conflicts.
    def set_slug
      self.slug ||= name.parameterize if name
    end
  end
end
