module Popolo
  # A politician.
  class Person
    include Mongoid::Document

    belongs_to :division, index: true
    belongs_to :party, index: true
    embeds_many :addresses, as: :addressable
    embeds_many :sources, as: :sourceable

    # The person's full name.
    field :name, type: String
    # A lowercase identifier composed of letters, numbers and dashes.
    field :slug, type: String

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
