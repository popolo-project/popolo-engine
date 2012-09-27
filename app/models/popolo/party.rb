module Popolo
  # A political party or organization.
  class Party
    include Mongoid::Document

    has_many :people
    embeds_many :sources, as: :sourceable

    # The party's official name.
    field :name, type: String
    # A lowercase identifier composed of letters, numbers and dashes.
    field :slug, type: String

    validates_presence_of :name, :slug

    # Woe to jurisdictions with non-unique party names!

    index({name: 1}, unique: true)
    index({slug: 1}, unique: true)

    before_validation :set_slug

    def self.find_by_slug(slug)
      where(slug: slug).first || find(slug)
    end

  private

    def set_slug
      self.slug ||= name.parameterize if name
    end
  end
end
