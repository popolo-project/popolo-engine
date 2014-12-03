module Popolo
  #A vote count is the number of votes for one option in a vote event.

  class Area
    include Mongoid::Document
    include Mongoid::Timestamps

    store_in Popolo.storage_options_per_class.fetch(:Area, Popolo.storage_options)

    field :name, type: String
    # Issued identifiers.
    embeds_many :identifiers, as: :identifiable, class_name: 'Popolo::Identifier'
    # An area category, e.g. city (https://github.com/opencivicdata/ocd-division-ids/#readme)
    field :classification, type: String
    #Provides access to parent and child areas
    recursively_embeds_many
    # URLs to source documents about the area.
    embeds_many :sources, as: :linkable, class_name: 'Popolo::Link'

    def to_s
      "Area: #{classification}: #{name}"
    end
  end
end
