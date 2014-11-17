module Popolo
  #A vote count is the number of votes for one option in a vote event.

  class Count
    include Mongoid::Document
    include Mongoid::Timestamps

    store_in Popolo.storage_options_per_class.fetch(:Count, Popolo.storage_options)

    # An option, e.g. yes, no, or abstain, paired etc
    field :option, type: String
    # e.g. 128
    field :value, type: Integer

    belongs_to :vote_event, class_name: 'Popolo::VoteEvent'

    #TODO: Group
    # "group": {
    # "name": "Bosniak"
    #}

    def to_s
      "Count: #{option}: #{value}"
    end
  end
end
