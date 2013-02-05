require_dependency 'popolo/application_controller'

module Popolo
  class OrganizationsController < ApplicationController
    inherit_resources
    respond_to :html, :json
    actions :index, :show
    custom_actions collection: :nested_index, resource: :nested_show

    before_filter :validate_path, only: [:nested_index, :nested_show]

    def index
      @organizations = Organization.roots
      index!
    end

    def show
      @organization = Organization.find_by_slug(params[:id])
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

    def validate_path
      parts = params[:path].split '/'
      @organization = Organization.find_by_slug parts.pop
      raise ImproperlyNestedResource unless parts == @organization.ancestors.map(&:slug)
    end
  end
end
