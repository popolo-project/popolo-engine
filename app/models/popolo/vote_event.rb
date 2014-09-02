module Popolo
  # A group with a common purpose or reason for existence that goes beyond the
  # set of people belonging to it.
  class VoteEvent
    include Mongoid::Document
    include Mongoid::Timestamps

    store_in Popolo.storage_options_per_class.fetch(:VoteEvent, Popolo.storage_options)

    # An issued identifier, e.g. a sequential number
    field :identifier, type: String
    # The motion being decided
    belongs_to :motion, class_name: 'Popolo::Motion'
    # The organization whose members are voting
    belongs_to :organization, class_name: 'Popolo::Organization'
    # The date on which the relationship began.
    field :start_date, type: DateTime
    # The date on which the relationship ended.
    field :end_date, type: DateTime
    # The result of the vote event (pass or fail, alternatively can use other ways to describe result)
    field :result, type: String
    #The individual votes
    has_many :votes, class_name: 'Popolo::Vote', dependent: :destroy

    #NB group results should not be reported if the
    #group results have no impact on the overall result of the vote event: for example, results by party.

    #TODO: has_many :group_results, class_name: 'Popolo::Group', dependent: :destroy
    #TODO: has_many :counts, class_name: 'Popolo::Count', dependent: :destroy

    #The vote totals dont need include all options from individual votes,
    #in particular options that have no effect on the result.

    #legislative_session - The legislative session in which the motion is proposed - not yet been specified

    def to_s
      "Vote event #{identifier}"
    end
  end
end
