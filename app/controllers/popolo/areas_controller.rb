module Popolo
  class AreasController < PopoloController
    inherit_resources
    respond_to :html, :json
    actions :index, :show
    custom_actions collection: :nested_index, resource: :nested_show

    before_filter :validate_path, only: [:nested_index, :nested_show]

    def index
      @areas = Area.roots
      index!
    end

    def show
      @area = Area.find_by_slug(params[:id])
      show!
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
