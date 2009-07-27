class AutoresController < ApplicationController
    
  def index
    list
    render :action => 'list'
  end

  def list
    # Listamos los autores que tengan alguna charla aprobada
    @autor_pages, @autores = paginate :autores, :per_page => 100, :order => 'nombre, apellidos', :include => :charlas, :conditions => ["charlas.aprobada = ?", true]
  end

end
