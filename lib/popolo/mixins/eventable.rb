module Popolo
  module Eventable
    extend ActiveSupport::Concern

    included do
      embeds_many :sources, as: :sourceable, class_name: 'Popolo::Source'
    end

    # @note It's not possible to do a many-to-many polymorphic relation, so
    #   we must create the relation manually.
    def events
      Event.where("related.#{self.class.name.demodulize.underscore}" => id)
    end
  end
end
