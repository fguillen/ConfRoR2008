class Edicion::AutoresController < ApplicationController


  
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
    @autor_pages, @autores = paginate :autores, :per_page => 100, :order => 'nombre'
  end

  def show
    @autor = Autor.find(params[:id])
  end

  def new
    @autor = Autor.new
  end

  def create
    @autor = Autor.new(params[:autor])
    if @autor.save
      flash[:notice] = 'Autor was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @autor = Autor.find(params[:id])
  end

  def update
    @autor = Autor.find(params[:id])
    if @autor.update_attributes(params[:autor])
      flash[:notice] = 'Autor was successfully updated.'
      redirect_to :action => 'show', :id => @autor
    else
      render :action => 'edit'
    end
  end

  def destroy
    Autor.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
