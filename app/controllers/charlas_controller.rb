class CharlasController < ApplicationController
  before_filter :login_required, :only => [:comentar, :mi_calendario]
  
  def index
    redirect_to :action => :calendario
  end

  def list
    @charlas = Charla.find(:all, :include => :sala, :conditions => {:aprobada => true}, :order => 'charlas.id') # cuando este aprobado, ordenar por sala y titulo
  end

  def show
    @charla = Charla.find(params[:id])
  end
  
  def calendario
    @salas = Sala.find(:all, :order => 'nombre')
    @charlas = Charla.find(:all, :order => 'fecha', :conditions => {:aprobada => true})
    @fechas = @charlas.collect {|c| c.fecha}.uniq
    render :layout => 'expanded'
  end
  
end
