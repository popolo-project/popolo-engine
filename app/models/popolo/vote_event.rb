module Popolo
  # An event at which people's votes are recorded.
  class VoteEvent
    include Mongoid::Document
    include Mongoid::Timestamps

    store_in Popolo.storage_options_per_class.fetch(:VoteEvent, Popolo.storage_options)

    # The organization whose members are voting.
    belongs_to :organization, class_name: 'Popolo::Organization'
    # The legislative session in which the vote occurs.
    # @todo belongs to :legislative_session, class_name: 'Popolo::Event'
    # The motion being decided.
    belongs_to :motion, class_name: 'Popolo::Motion'
    # The result of the vote event within groups of voters.
    embeds_many :group_results, class_name: 'Popolo::GroupResult'
    # The number of votes for options.
    has_many :counts, class_name: 'Popolo::Count', dependent: :destroy
    # Voters' votes.
    has_many :votes, class_name: 'Popolo::Vote', dependent: :destroy

    # An issued identifier.
    field :identifier, type: String
    # The date on which the relationship began.
    field :start_date, type: DateTime
    # The date on which the relationship ended.
    field :end_date, type: DateTime
    # The result of the vote event.
    field :result, type: String

    def to_s
      identifier
    end
  end
end
