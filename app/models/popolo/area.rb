module Popolo
  # An area, most often an administrative division.
  #
  # Turtle document:
  #
  #     <http://example.com/areas/77cc67093475061e3d95369d.ttl>
  #       @todo
  #
  # @note There is an upper limit to the number of administrative levels;
  #   however, there is little agreement as to what those levels are. Therefore,
  #   instead of having a different model for each administrative level – which
  #   would have advantages – we use a flexible tree structure.
  class Area
    include Mongoid::Document
    include Mongoid::Paranoia
    include Mongoid::Timestamps
    include Mongoid::Tree

    include Popolo::Mixins::Sluggable
    include Popolo::Mixins::Eventable

    # Woe to jurisdictions with non-unique administrative division names!

    index({name: 1}, unique: true)
  end
end
