class AsistenciasController < ApplicationController
  before_filter :login_required
  
  def voy_a_ir
    @charla = Charla.find_by_id( params[:charla_id] )
    raise "charla no encontrada, id:#{params[:charla_id]}" if @charla.nil?
    
    @asistencia = Asistencia.new()
    @asistencia.charla = @charla
    @asistencia.usuario = current_usuario
    
    if @asistencia.save
      flash[:notice] = "Asistencia añadida"
    end
    
    if params[:from] == 'calendario'
      redirect_to :controller => 'charlas', :action => 'calendario'
    else
      redirect_to :controller => 'charlas', :action => 'show', :id => @charla.id
    end
  end
  
  def no_voy_a_ir
    @charla = Charla.find_by_id( params[:charla_id] )
    raise "charla no encontrada, id:#{params[:charla_id]}" if @charla.nil?
    
    @asistencia = Asistencia.find_by_usuario_id_and_charla_id( current_usuario.id, @charla.id )
    @asistencia.destroy unless @asistencia.nil?
    flash[:notice] = "Asistencia borrada"
    
    if params[:from] == 'calendario'
      redirect_to :controller => 'charlas', :action => 'calendario'
    else
      redirect_to :controller => 'charlas', :action => 'show', :id => @charla.id
    end
  end
end