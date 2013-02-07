module Popolo
  module Generators
    # Run this generator once before using Popolo in your application.
    #
    # @example
    #   rails generate popolo
    class PopoloGenerator < Rails::Generators::Base
      desc "Adds a rescue_from block to ApplicationController."

      namespace 'popolo'

      def add_rescue_from_block_to_application_controller
        inject_into_class 'app/controllers/application_controller.rb', 'ApplicationController' do
          <<-EOS
  rescue_from Mongoid::Errors::DocumentNotFound, Popolo::ImproperlyNestedResource do |exception|
    respond_to do |format|
      format.html { render file: Rails.root.join('public', '404.html'), status: :not_found }
      format.json { head :not_found }
      format.atom { head :not_found }
    end
  end
          EOS
        end
      end
    end
  end
end
