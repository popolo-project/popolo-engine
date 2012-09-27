require_dependency 'popolo/application_controller'

module Popolo
  class DivisionsController < ApplicationController
    inherit_resources
    respond_to :html, :json
    actions :index, :show
    custom_actions resource: :nested_show, collection: :nested_index

    before_filter :validate_path, only: [:nested_index, :nested_show]

    def index
      @divisions = Division.roots
      index!
    end

    def show
      @division = Division.find_by_slug(params[:id])
      show!
    end

    def nested_index
      @divisions = @division.children

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

    def validate_path
      parts = params[:path].split '/'
      @division = Division.find_by_slug parts.pop
      raise Popolo::ImproperlyNestedResource unless parts == @division.ancestors.map(&:slug)
    end
  end
end
