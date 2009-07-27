class UsuarioObserver < ActiveRecord::Observer

  def after_create(usuario)
    UsuarioMailer.deliver_signup_notification(usuario)
  end

  def after_save(usuario) 
    UsuarioMailer.deliver_activation(usuario) if usuario.recently_activated?
    UsuarioMailer.deliver_forgot_password(usuario) if usuario.recently_forgot_password?
    UsuarioMailer.deliver_new_password(usuario) if usuario.recently_new_password?
    UsuarioMailer.deliver_pagado(usuario) if usuario.recently_pagado?
    UsuarioMailer.deliver_nopagado(usuario) if usuario.recently_nopagado?
    UsuarioMailer.deliver_pagadocena(usuario) if usuario.recently_pagadocena?
    UsuarioMailer.deliver_nopagadocena(usuario) if usuario.recently_nopagadocena?
  end
  
end
