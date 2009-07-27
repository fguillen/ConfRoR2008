class ComentariosController < ApplicationController
  before_filter :login_required
  
  def comentar
    @charla = Charla.find_by_id( params[:comentario][:charla_id] )
    raise "charla no encontrada id: #{params[:comentario][:charla_id]}" if @charla.nil?
    
    @comentario = Comentario.new( params[:comentario] )
    @comentario.usuario = current_usuario
    
    if @comentario.save
      flash[:notice] = "Comentario enviado"
    end
    
    
    redirect_to :controller => 'charlas', :action => "show", :id => @charla.id
  end
end