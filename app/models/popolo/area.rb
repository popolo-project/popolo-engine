module Popolo
  # An area, most often an administrative division.
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

    include Popolo::Sluggable

    # Organizations related to the area, e.g. governments.
    has_many :organizations, class_name: 'Popolo::Organization'
    # Posts related to the area, e.g. officials.
    has_many :posts, class_name: 'Popolo::Post'

    # Woe to jurisdictions with non-unique administrative division names!

    index({name: 1}, unique: true)
  end
end
