module Popolo
  # An area, most often an administrative division.
  #
  # @note There is an upper limit to the number of administrative levels;
  #   however, there is little agreement as to what those levels are. Therefore,
  #   instead of having a different model for each administrative level – which
  #   would have advantages – we use a flexible tree structure.
  class Area
    include Mongoid::Document
    include Mongoid::Tree

    embeds_many :sources, as: :sourceable

    # The area's name.
    field :name, type: String
    # A lowercase identifier composed of letters, numbers and dashes.
    field :slug, type: String
    # Any additional information to store about the area.
    field :extra, type: Hash

    validates_presence_of :name, :slug

    # Woe to jurisdictions with non-unique administrative division names!

    index({name: 1}, unique: true)
    index({slug: 1}, unique: true)
    index({'sources.name' => 1}, unique: true)

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
