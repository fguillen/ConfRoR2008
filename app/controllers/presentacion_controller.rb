class PresentacionController < ApplicationController
  
  def show
  end

  def asistentes
    @usuarios = Usuario.publicos
    render :layout => 'expanded'
  end

end