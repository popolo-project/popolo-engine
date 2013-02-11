module Popolo
  class OrganizationsController < PopoloController
    inherit_resources
    # inherited_resources assumes the routes are namespaced. If an engine is
    # mounted at root, however, there will be no namespace.
    self.resources_configuration[:self][:route_prefix] = nil

    respond_to :html, :json
    actions :index, :show
    custom_actions collection: :nested_index, resource: :nested_show

    before_filter :validate_path, only: [:nested_index, :nested_show]

    def index
      @organizations = Organization.roots
      index!
    end

    def show
      @organization = Organization.find_by_slug_or_id(params[:id])
      show!
    end

    def nested_index
      @organizations = @organization.children

      nested_index! do |format|
        format.html { render action: 'index'}
      end
    end

    def nested_show
      nested_show! do |format|
        format.html { render action: 'show'}
      end
    end

  protected

    # @raises [Mongoid::Errors::DocumentNotFound] if a resource is improperly nested
    def validate_path
      parts = params[:path].split '/'
      parts.each do |part|
        @organization = Organization.find_by(parent_id: @organization, slug: part)
      end
    end
  end
end
