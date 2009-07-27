class Edicion::CharlasController < ApplicationController

  
  access_control :DEFAULT => 'admin'
  before_filter :login_required

  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @charla_pages, @charlas = paginate :charlas, :per_page => 100, :order => 'aprobada DESC, confirmada DESC, titulo'
    
    @email_aprobados = []
    for charla in Charla.find(:all, :conditions => {:aprobada => true})
      for autor in charla.autores
        @email_aprobados << autor.email if (!@email_aprobados.include? autor.email)
      end
    end
    @email_aprobados.uniq.sort!
    
    @email_rechazados = []
    for charla in Charla.find(:all, :conditions => {:aprobada => false})
      for autor in charla.autores
        @email_rechazados << autor.email if (!@email_rechazados.include? autor.email)
      end
    end
    @email_rechazados.uniq.sort!
    
    @email_aprobados_confirmados = []
    for charla in Charla.find(:all, :conditions => {:aprobada => true, :confirmada => true})
      for autor in charla.autores
        @email_aprobados_confirmados << autor.email if (!@email_aprobados_confirmados.include? autor.email)
      end
    end
    @email_aprobados_confirmados.uniq.sort!    

    @email_aprobados_no_confirmados = []
    for charla in Charla.find(:all, :conditions => {:aprobada => true, :confirmada => false})
      for autor in charla.autores
        @email_aprobados_no_confirmados << autor.email if (!@email_aprobados_no_confirmados.include? autor.email)
      end
    end
    @email_aprobados_no_confirmados.uniq.sort!    
  end
  
  def exportar
    @charlas = Charla.find(:all, :order => 'id')
    @autores = Autor.find(:all, :order => 'nombre')
    render :layout => false
  end

  def show
    @charla = Charla.find(params[:id])
  end

  def new
    cargar_datos  
    @charla = Charla.new
  end

  def create
    @charla = Charla.new(params[:charla])
    if @charla.save
      flash[:notice] = 'Charla was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    cargar_datos
    @charla = Charla.find(params[:id])
  end

  def update
    @charla = Charla.find(params[:id])
    if @charla.update_attributes(params[:charla])
      flash[:notice] = 'Charla was successfully updated.'
      redirect_to :action => 'show', :id => @charla
    else
      render :action => 'edit'
    end
  end

  def destroy
    Charla.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
  
  def aprobacion
    @charla = Charla.find(params[:id])
    @charla.aprobada = !@charla.aprobada
    @charla.save
    redirect_to :action => 'list'
  end  
  
  def confirmacion
    @charla = Charla.find(params[:id])
    @charla.confirmada = !@charla.confirmada
    @charla.save
    redirect_to :action => 'list'
  end   
  
  private
  
  def cargar_datos
    @autores = Autor.find(:all, :order => 'nombre, apellidos')
    @salas = Sala.find(:all, :order => 'nombre')
  end  
end
