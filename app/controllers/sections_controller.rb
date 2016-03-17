class SectionsController < ApplicationController
  before_action :fetch_klass

  def index
    @sections = @klass.sections
  end

  def new
    @section = @klass.sections.new
  end

  def create
    @section = @klass.sections.new
    @section.name = params[:section][:name]
    @save_success = @section.save
  end

private
def fetch_klass
  @klass = Klass.find(params[:klass_id])
end
end
