module Popolo
  module Sluggable
    extend ActiveSupport::Concern

    included do
      # The field used as the basis of the slug, usually the resource's name.
      field slug_source, type: String
      # A lowercase identifier composed of letters, numbers and dashes.
      field :slug, type: String

      validates_presence_of slug_source, :slug

      before_validation :set_slug
    end

    module ClassMethods
      # Finds a resource by its slug or ID.
      #
      # @param [String] slug a slug or ID
      # @return a matching resource
      def find_by_slug_or_id(slug)
        where(slug: slug.to_s.parameterize).first || find(slug)
      end

      # Finds a resource by its slug or raises an error.
      #
      # @param [String] slug a slug
      # @param [Hash] opts conditions
      # @return a matching resource
      # @raises [Mongoid::Errors::DocumentNotFound] if not found
      def find_by_slug(slug, opts = {})
        find_by(opts.merge(slug: slug.parameterize))
      end

      # @private
      def slug_source
        if defined?(super)
          super
        else
          :name
        end
      end
    end

    def to_param
      slug
    end

  private

    # @return [String] the value of the field used as the basis of the slug
    def slug_source
      send(self.class.slug_source)
    end

    # @note Leave it to the content manager to choose a slug in case of conflicts.
    def set_slug
      self.slug ||= slug_source.parameterize if slug_source
    end
  end
end
