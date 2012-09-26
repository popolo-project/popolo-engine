module Popolo
  # A political party or organization.
  class Party
    include Mongoid::Document

    has_many :people

    # The party's official name.
    field :name, type: String
    # A lowercase identifier composed of letters, numbers and dashes.
    field :slug, type: String

    validates_presence_of :name, :slug

    # Woe to jurisdictions with non-unique party names!
    index({name: 1}, unique: true)
    index({slug: 1}, unique: true)
  end
end
