# This controller handles the login/logout function of the site.  
class SesionController < ApplicationController

  # render new.rhtml
  def new
  end

  def create
    self.current_usuario = Usuario.authenticate(params[:login], params[:password])
    if logged_in?
      if params[:remember_me] == "1"
        self.current_usuario.remember_me
        cookies[:auth_token] = { :value => self.current_usuario.remember_token , :expires => self.current_usuario.remember_token_expires_at }
      end
      redirect_back_or_default(perfil_url(current_usuario))
      #flash[:notice] = "Logged in successfully"
    else
      flash[:notice] = "Combinación incorrecta de usuario y contraseña."
      redirect_to :back
    end
  end

  def destroy
    self.current_usuario.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    #flash[:notice] = "You have been logged out."
    redirect_back_or_default('/')
  end
end
