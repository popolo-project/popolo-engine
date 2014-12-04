module Popolo
  # A voter's vote in a vote event.
  class Vote
    include Mongoid::Document

    store_in Popolo.storage_options_per_class.fetch(:Vote, Popolo.storage_options)

    # A vote event.
    belongs_to :vote_event, class_name: 'Popolo::VoteEvent'
    # The person or organization that is voting.
    belongs_to :voter, polymorphic: true
    # The voter's primary political group.
    belongs_to :group, class_name: 'Popolo::Organization'
    # The person with whom the voter is paired.
    belongs_to :pair, class_name: 'Popolo::Person'

    # The option chosen by the voter, whether actively or passively.
    field :option, type: String
    # The voter's role in the event.
    field :role, type: String
    # The weight of the voter's vote.
    field :weight, type: Float, default: 1.0

    def to_s
      "#{voter.name}: #{option}"
    end
  end
end
