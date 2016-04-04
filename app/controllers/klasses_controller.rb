class KlassesController < ApplicationController
  def index
    @klasses = Klass.includes(students: [:house]).all
    @new_klass = Klass.new
    respond_to do |format|
      format.html
      format.xml { render :xml => @klasses.to_xml}
      format.json { render :json => @klasses.to_json}
    end
  end

  def create
    @klass = Klass.new
    @klass.name = params[:klass][:name]
    @save_success = @klass.save
  end

end
