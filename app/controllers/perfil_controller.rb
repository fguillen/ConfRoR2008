class PerfilController < ApplicationController
  
  before_filter :get_usuario_perfil
  before_filter :login_required
  
  # GET /perfil
  def show
    respond_to do |format|
      format.html # index.rhtml
    end
  end

  # GET /perfil;edit
  def edit
  end

  # PUT /perfil
  def update
    respond_to do |format|
      if @perfil.update_attributes(params[:perfil])
        flash[:notice] = 'Perfil actualizado correctamente.'
        format.html { redirect_to perfil_url(@usuario) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  private
  
  def get_usuario_perfil
    if current_usuario.roles.include_admin?
      @usuario = Usuario.find(params[:usuario_id])
    else
      unless current_usuario.id == params[:usuario_id].to_i
        #flash[:notice] = "¿ No estarás intentando ... ?"
        #redirect_to perfil_url(current_usuario.perfil)
        raise "Alguien esta intentando ver el perfil de otro usuario."
      end
      @usuario = current_usuario
    end
    @perfil = @usuario.perfil
  end

end
