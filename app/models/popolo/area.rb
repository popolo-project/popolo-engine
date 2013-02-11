module Popolo
  # A bounded area, like an administrative boundary.
  #
  # @note There is an upper limit to the number of administrative levels;
  #   however, there is little agreement as to what those levels are. Therefore,
  #   instead of having a different model for each administrative level – which
  #   would have advantages – we use a flexible tree structure.
  class Area
    include Mongoid::Document
    include Mongoid::Tree

    include Popolo::Sluggable
    index({slug: 1, parent_id: 1}, unique: true)

    # Memberships related to the area, e.g. officials.
    has_many :memberships, class_name: 'Popolo::Membership'
    # Organizations related to the area, e.g. governments.
    has_many :organizations, class_name: 'Popolo::Organization'
    # Posts related to the area, e.g. officials.
    has_many :posts, class_name: 'Popolo::Post'

    # The area's sort name.
    field :sort_name, type: String
    # The area's category.
    field :classification, type: String

    validates_presence_of :sort_name

    before_validation :set_sort_name

  private

    def set_sort_name
      self.sort_name ||= name
    end
  end
end
