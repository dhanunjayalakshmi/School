class SectionsController < ApplicationController
  before_action :fetch_klass

  def index
    @sections = @klass.sections.includes(students: [:house])
    respond_to do |format|
      format.html
      format.xml { render :xml => @sections.to_xml}
      format.json { render :json => @sections.to_json}
    end
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
