class UsuariosController < ApplicationController
  before_filter :login_required, :except => [:new, :create, :activate, :reset, :reset_password]
  access_control [:index, :destroy, :activados, :noactivados, 
                  :pagados, :nopagados, :pagado, :nopagado, :editar_tarifa]=> 'admin'
      
  def index
    store_location
    role_title = params[:role_title]
    unless role_title.nil?
      @usuarios = Usuario.find_by_role(role_title)
      @title = "rol: " + role_title
    else
      @usuarios = Usuario.find(:all)
      @title = "todos"
    end
  end
  
  def new
  end

  def create
    @usuario = Usuario.new(params[:usuario])
    @usuario.build_perfil(params[:perfil])
    role = Role.find_by_title('asistente')
    @usuario.roles << role
    if Usuario.count == 0
      role = Role.find_by_title('admin')
      @usuario.roles << role
    end
    @usuario.tarifa = Tarifa.actual
    @perfil = @usuario.perfil
    @usuario.save!
    rescue ActiveRecord::RecordInvalid
      errors = ActiveRecord::Errors.new(nil)
      @usuario.errors.each { |k,m| errors.add(k,m) unless k == "perfil" }
      @usuario.errors.clear
      errors.each { |k,m| @usuario.errors.add(k, m) }
      render :action => 'new'
  end
  
  def destroy
    if @usuario = Usuario.find(params[:id])
      @usuario.destroy
      flash[:notice] = "El usuario ha sido borrado"
      redirect_back_or_default('/')
    end
  end

  def activados
    store_location
    @usuarios = Usuario.activados
    @title = "activados"
    render :action => 'index'
  end
  
  def noactivados
    store_location
    @usuarios = Usuario.noactivados
    @title = "no activados"
    render :action => 'index'
  end
  
  def pagados
    store_location
    @usuarios = Usuario.pagados
    @title = "pagados"
    render :action => 'index'
  end
  
  def nopagados
    store_location
    @usuarios = Usuario.nopagados
    @title = "no pagados"
    render :action => 'index'
  end
  
  def cena
    store_location
    @usuarios = Usuario.cena
    @title = "asisten a la cena"
    render :action => 'index'
  end

  def activate
    usuario = Usuario.find_by_activation_code(params[:activation_code])
    raise "codigo de activacion no valido" if usuario.nil?
    self.current_usuario = usuario
    if logged_in? && !current_usuario.activated?
      current_usuario.activate
    end 
    redirect_back_or_default(perfil_url(current_usuario))
  end
  
  def reset
    if request.post?
      if @usuario = Usuario.find_by_email(params[:correo])
        @usuario.forgot_password
        @usuario.save
      end
      flash[:notice] = "Te hemos enviado un mensaje para resetear la contraseña."
      redirect_back_or_default('/')
    end
  end

  def reset_password
    @usuario = Usuario.find_by_password_reset_code(params[:password_reset_code])
    if @usuario
      @usuario.new_password
      @usuario.save
      flash[:notice] = "Te hemos enviado la nueva contraseña por correo."
    else
      flash[:notice] = "El código introducido no pertenece a ningún usuario."
    end
    redirect_back_or_default('/')
  end

  def pagado
    if @usuario = Usuario.find(params[:id])
      @usuario.pagado
      redirect_back_or_default('/')
    end
  end
  
  def nopagado
    if @usuario = Usuario.find(params[:id])
      @usuario.nopagado
      redirect_back_or_default('/')
    end
  end
  
  def pagadocena
    if @usuario = Usuario.find(params[:id])
      @usuario.pagadocena
      redirect_back_or_default('/')
    end
  end
  
  def nopagadocena
    if @usuario = Usuario.find(params[:id])
      @usuario.nopagadocena
      redirect_back_or_default('/')
    end
  end

  def editar_tarifa
    if request.get?
      @usuario = Usuario.find(params[:id])  
    elsif request.post?
      @usuario = Usuario.find(params[:usuario][:id])
      tarifa= Tarifa.find(params[:usuario][:tarifa_id])
      @usuario.tarifa = tarifa
      @usuario.save
      flash[:notice] = "Tarifa modificada."
      redirect_back_or_default('/')
    end
  end

end
