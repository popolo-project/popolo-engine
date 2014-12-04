module Popolo
  # The number of votes for one option in a vote event.
  class Count
    include Mongoid::Document

    store_in Popolo.storage_options_per_class.fetch(:Count, Popolo.storage_options)

    # The number of votes for options.
    belongs_to :vote_event, class_name: 'Popolo::VoteEvent'

    # An option in a vote event.
    field :option, type: String
    # The number of votes for an option.
    field :value, type: Integer
    # A group of voters.
    field :group

    validates_presence_of :option, :value

    def to_s
      "#{option}: #{value}"
    end
  end
end
