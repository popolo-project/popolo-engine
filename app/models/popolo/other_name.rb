module Popolo
  # An alternate or former name.
  class OtherName
    include Mongoid::Document

    embedded_in :nameable, polymorphic: true

    # An alternate or former name.
    field :name, type: String
    # The date on which the name was adopted.
    field :start_date, type: DateString
    # The date on which the name was abandoned.
    field :end_date, type: DateString
    # A note, e.g. 'Birth name'.
    field :note, type: String

    validates_presence_of :name
    validates_format_of :start_date, with: DATE_STRING_FORMAT, allow_blank: true
    validates_format_of :end_date, with: DATE_STRING_FORMAT, allow_blank: true
  end
end
