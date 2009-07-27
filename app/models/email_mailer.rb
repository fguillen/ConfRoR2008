class EmailMailer < ActionMailer::Base
  def email(email)
    @from        = email.from
    #@from        = "hola@correo.zanaguara.net"
    @subject     = "[CONFERENCIARAILS] " + email.subject
    @sent_on     = email.sent_on
    @body[:text] = email.body
    usuarios = []
    case email.recipients
    when "todos"
      usuarios = Usuario.find(:all)
    when "activados"
      usuarios = Usuario.activados
    when "no activados"
      usuarios = Usuario.noactivados
    when "pagados"
      usuarios = Usuario.pagados
    when "no pagados"
      usuarios = Usuario.nopagados
    end
    @bcc = []
    usuarios.each do |usuario|
      @bcc << usuario.email
    end
  end
end