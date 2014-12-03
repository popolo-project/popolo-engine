module Popolo
  # A date expressed as a string.
  # @see http://mongoid.org/en/mongoid/docs/documents.html#custom_fields
  class DateTimeString < String
    def mongoize
      self.class.mongoize(self)
    end

    class << self
      def demongoize(object)
        object.nil? ? nil : DateTime.parse(object)
      end

      def mongoize(object)
        object.nil? ? nil : object.to_s
      end

      def evolve(object)
        mongoize(object)
      end
    end
  end
end
