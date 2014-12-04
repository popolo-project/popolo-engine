module Popolo
  # A result of a vote event within a group of voters.
  class GroupResult
    include Mongoid::Document

    embedded_in :vote_event, class_name: 'Popolo::VoteEvent'

    # A group of voters.
    field :group
    # The result of the vote event within a group of voters.
    field :result, type: String

    validates_presence_of :group, :result
  end
end
