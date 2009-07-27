class VotosController < ApplicationController
  before_filter :login_required
  
  def votar
    @charla = Charla.find_by_id( params[:charla_id] )
    raise "charla no encontrada id: #{params[:charla_id]}" if @charla.nil?
    
    @voto = Voto.find_by_usuario_id_and_charla_id( current_usuario.id, @charla.id )
    if !@voto.nil?
      # está actualizando su voto  
      @voto.puntos = params[:puntos]
    else
      # o es un voto nuevos
      @voto = Voto.new
      @voto.charla = @charla
      @voto.puntos = params[:puntos]
      @voto.usuario = current_usuario
    end
    
    if @voto.save
      flash[:notice] = "Voto enviado"
    end
    
    redirect_to :controller => 'charlas', :action => "show", :id => @charla.id
  end
end