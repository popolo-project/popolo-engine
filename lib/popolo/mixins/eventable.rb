module Popolo
  module Mixins
    module Eventable
      extend ActiveSupport::Concern

      included do
        embeds_many :sources, as: :sourceable, class_name: 'Popolo::Source'
      end
    end
  end
end
