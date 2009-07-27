class Edicion::SalasController < ApplicationController


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
    @sala_pages, @salas = paginate :salas, :per_page => 10
  end

  def show
    @sala = Sala.find(params[:id])
  end

  def new
    @sala = Sala.new
  end

  def create
    @sala = Sala.new(params[:sala])
    if @sala.save
      flash[:notice] = 'Sala was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @sala = Sala.find(params[:id])
  end

  def update
    @sala = Sala.find(params[:id])
    if @sala.update_attributes(params[:sala])
      flash[:notice] = 'Sala was successfully updated.'
      redirect_to :action => 'show', :id => @sala
    else
      render :action => 'edit'
    end
  end

  def destroy
    Sala.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
