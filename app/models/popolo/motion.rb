module Popolo
  # A group with a common purpose or reason for existence that goes beyond the
  # set of people belonging to it.
  class Motion
    include Mongoid::Document
    include Mongoid::Timestamps
    include Mongoid::Tree

    store_in Popolo.storage_options_per_class.fetch(:Motion, Popolo.storage_options)

    # The organization in which the motion is proposed
    belongs_to :organization, class_name: 'Popolo::Organization'

    #legislative_session   opengov:legislativeSession  The legislative session in which the motion is proposed
    #TODO: a field for legislative session?

    # The person who proposed the motion
    belongs_to :creator, class_name: 'Popolo::Person'
    # The transcript or text of the motion.
    field :text, type: Text
    # A motion category, e.g. adjournment.
    field :classification, type: String
    # The date on which the motion was proposed.
    field :date, type: Popolo::DateString
    # The requirement for the motion to be adopted
    field :requirement, type: String
    # The result of the motion (pass or fail, alternatively can use other ways to describe result)
    field :result, type: String
    # An event at which people vote on the motion
    has_many :vote_event, class_name: 'Popolo::VoteEvent', dependent: :destroy
    # URLs to source documents about the motion.
    embeds_many :sources, as: :linkable, class_name: 'Popolo::Link'

    validates_format_of :start_date, with: /\A\d{4}(-\d{2}){0,2}\z/, allow_blank: true

    def to_s
      "Motion #{id} (#{date})"
    end
  end
end
