module Popolo
  # A formal step to introduce a matter for consideration by an organization.
  class Motion
    include Mongoid::Document
    include Mongoid::Timestamps

    store_in Popolo.storage_options_per_class.fetch(:Motion, Popolo.storage_options)

    # The organization in which the motion is proposed.
    belongs_to :organization, class_name: 'Popolo::Organization'
    # The legislative session in which the motion is proposed.
    belongs to :legislative_session # @todo , class_name: 'Popolo::Event'
    # The person who proposed the motion.
    belongs_to :creator, class_name: 'Popolo::Person'
    # Events at which people vote on the motion.
    has_many :vote_events, class_name: 'Popolo::VoteEvent', dependent: :destroy
    # URLs to documents from which the motion is derived.
    embeds_many :sources, as: :linkable, class_name: 'Popolo::Link'

    # The transcript or text of the motion.
    field :text, type: String
    # An issued identifier.
    field :identifier, type: String
    # A motion category, e.g. adjournment.
    field :classification, type: String
    # The date on which the motion was proposed.
    field :date, type: DateString
    # The requirement for the motion to be adopted.
    field :requirement, type: String
    # The result of the motion.
    field :result, type: String

    validates_format_of :date, with: DATE_STRING_FORMAT, allow_blank: true

    def to_s
      text.to_s[0...140]
    end
  end
end
