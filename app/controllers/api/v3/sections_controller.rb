module Api
  module V3
    class SectionsController < ApplicationController
      before_action :fetch_klass
      before_action :fetch_section, only: [:show, :update, :destroy]

      def index
        @sections = @klass.sections
      end

      def show
      end

      def create
        @section = @klass.sections.new
        @section.name = params[:name]
        if @section.save
          head :created, location: api_klass_section_url(@klass, @section)
        else
          head :bad_request
        end
      end

      def update
        @section.name = params[:name]
        if @section.save
          head :serveraccepted, location: api_klass_section_url(@section)
        else
          head :bad_request
        end
      end

      def destroy
        if params[:name] == @section.name
          @section.destroy
          head :ok
        else
          head :bad_request
        end
      end

    private
      def fetch_klass
        @klass = Klass.find(params[:klass_id])
      end

      def fetch_section
        @section = @klass.sections.find(params[:id])
      end

    end
  end
end
