module Popolo
  # A group with a common purpose or reason for existence that goes beyond the
  # set of people belonging to it.
  class Vote
    include Mongoid::Document
    include Mongoid::Timestamps
    include Mongoid::Tree

    store_in Popolo.storage_options_per_class.fetch(:Vote, Popolo.storage_options)

    # The motion being decided
    belongs_to :vote_event, class_name: 'Popolo::VoteEvent'
    # The organization/person who voted
    field :voter_id, type: String #TODO: this should be polymorphic as person or organisation can vote
    # The option chosen by the voter, whether actively or passively - options recommended: yes, no, abstain, absent, not voting, paired
    field :option, type: String
    # The voters primary political group
    belongs_to :group, class_name: 'Popolo::Organization'
    # The voters role in the event e.g. 'chair'
    field :role, type: String
    # The weight of the voter's vote
    field :weight, type: Float, :default => 1.0
    # The person with whom the voter is paired
    belongs_to :pair, class_name: 'Popolo::Person'

    def to_s
      "#{option} from #{voter_id}"
    end
  end
end
