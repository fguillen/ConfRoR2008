class UsuarioMailer < ActionMailer::Base
  def signup_notification(usuario)
    setup_email(usuario)
    @subject    += 'Por favor, active su cuenta'
    @body[:url]  = server + "activa/#{usuario.activation_code}"
    
  end
  
  def activation(usuario)
    setup_email(usuario)
    @subject    += '¡Tu cuenta ha sido activada!'
    @body[:url]  = server
  end
  
  def forgot_password(usuario)
    setup_email(usuario)
    @subject    += 'Reseteo de tu contraseña.'
    @body[:url]  = server + "reset_password/#{usuario.password_reset_code}"
  end
  
  def new_password(usuario)
    setup_email(usuario)
    @subject += 'Te hemos generado una nueva contraseña'
  end
  
  def pagado(usuario)
    setup_email(usuario)
    @subject += 'Hemos recibido tu pago de la conferencia'
  end
  
  def nopagado(usuario)
    setup_email(usuario)
    @subject += 'No hemos recibido tu pago de la conferencia'
  end

  def pagadocena(usuario)
    setup_email(usuario)
    @subject += 'Hemos recibido tu pago de la cena'
  end
  
  def nopagadocena(usuario)
    setup_email(usuario)
    @subject += 'No hemos recibido tu pago de la cena'
  end
  
  
  protected
    def setup_email(usuario)
      @recipients  = "#{usuario.email}"
      @from        = "registro@conferenciarails.org"
      @subject     = "[CONFERENCIARAILS] "
      @sent_on     = Time.now
      @body[:usuario] = usuario
    end
    
    def server
      case RAILS_ENV 
        when 'production'
          "http://app.conferenciarails.org/"
        when 'development'
          "http://dev.conferenciarails.org:3003/"
        when 'test'
          "http://test.conferenciarails.org:3000/"
      end
    end
end
