class RolesController < ApplicationController

  access_control :DEFAULT => 'admin'
  before_filter :get_roles
  before_filter :login_required
  
  def destroy
    role = Role.find(params[:id])
    usuario = Usuario.find(params[:usuario_id])
    usuario.roles.delete role
    flash[:notice] = "El rol ha sido borrado."
    redirect_to perfil_path(usuario)
  end
  
  def create
    role = Role.find(params[:id])
    usuario = Usuario.find(params[:usuario_id])
    usuario.roles << role
    flash[:notice] = "El rol ha sido añadido."
    redirect_to perfil_path(usuario)
  end
  
  private
  
  def get_roles
    if current_usuario.roles.include_admin?
      @roles = Usuario.find(params[:usuario_id]).roles
    else
      @roles = current_usuario.roles
    end
  end

end
