require_dependency 'popolo/application_controller'

module Popolo
  class DivisionsController < ApplicationController
    inherit_resources
    respond_to :html, :json
    actions :index, :show

    def index
      @divisions = Division.roots
      index!
    end

    def show
      @division = Division.find_by_slug(params[:id])
      show!
    end

    def glob
      parts = params[:path].split '/'
      children = parts.pop if parts.last == 'divisions'

      base = Division
      @divisions = []
      parts.each do |part|
        division = base.find_by(slug: part)
        base = division.children
        @divisions << division
      end
    end
  end
end
