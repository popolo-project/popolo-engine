module Popolo
  module Generators
    # Run this generator once before using Popolo in your application.
    #
    # @example
    #   rails generate popolo
    class PopoloGenerator < Rails::Generators::Base
      desc "Adds Popolo routes and rescues Mongoid exceptions."

      namespace 'popolo'
      source_root File.expand_path('../templates', __FILE__)

      def add_routes
        route "mount Popolo::Engine => '/'"
      end

      def add_rescue_from_block_to_application_controller
        inject_into_class 'app/controllers/application_controller.rb', 'ApplicationController' do
          <<-EOS
  rescue_from Mongoid::Errors::DocumentNotFound do |exception|
    respond_to do |format|
      format.html { render file: Rails.root.join('public', '404.html'), status: :not_found, layout: false }
      format.json { head :not_found }
      format.atom { head :not_found }
    end
  end
          EOS
        end
      end

      def add_ruby_version_to_gemfile
        prepend_to_file 'Gemfile', "ruby '1.9.3'"
      end

      def show_readme
        readme 'README' if behavior == :invoke
      end
    end
  end
end
