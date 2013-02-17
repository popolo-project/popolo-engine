module Popolo
  class AreasController < PopoloController
    inherit_resources
    # inherited_resources assumes the routes are namespaced. If an engine is
    # mounted at root, however, there will be no namespace.
    self.resources_configuration[:self][:route_prefix] = nil

    respond_to :html, :json
    actions :index, :show
    custom_actions collection: :nested_index, resource: [:nested_show, :posts]

    before_filter :validate_path, only: [:nested_index, :nested_show, :posts]

    def index
      @areas = Area.roots
      index!
    end

    def nested_index
      @areas = @area.children

      nested_index! do |format|
        format.html { render action: 'index'}
      end
    end

    def nested_show
      nested_show! do |format|
        format.html { render action: 'show'}
      end
    end

    def posts
      @posts = @area.posts
    end

  protected

    # @raises [Mongoid::Errors::DocumentNotFound] if a resource is improperly nested
    def validate_path
      parts = params[:path].split '/'
      parts.each do |part|
        @area = Area.find_by(parent_id: @area, slug: part)
      end
    end
  end
end
