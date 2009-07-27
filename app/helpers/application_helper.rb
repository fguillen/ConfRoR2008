# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def quita_acentos( cadena )
    cadena = cadena.gsub("á", "a")
    cadena = cadena.gsub("é", "e")
    cadena = cadena.gsub("í", "i")
    cadena = cadena.gsub("ó", "o")
    cadena = cadena.gsub("ú", "u")
    cadena = cadena.gsub("ñ", "n")
    
    cadena = cadena.gsub("Á", "A")
    cadena = cadena.gsub("É", "E")
    cadena = cadena.gsub("Í", "I")
    cadena = cadena.gsub("Ó", "O")
    cadena = cadena.gsub("Ú", "U")
    cadena = cadena.gsub("Ñ", "N")    
  end
  
  def format(date)
    date.strftime("%d/%m/%Y %H:%M (UTC)")
  end

  def check_url(url)
    unless url =~ /^http:\/\//
      url = "http://" + url
    end
    return url
  end
  
  def title(page_title)
    content_for(:title) { page_title }
  end
  
  def menu(name, options = {}, html_options = {}, &block)
    name = "<span>" + name + "</span>"
    content = link_to(name, options, html_options, &block).to_s
    if current_page?(options)
      "<li class=\"current\">#{content}</li>"
    else
      "<li>#{content}</li>"
    end
  end
  
  def base_url
    request.protocol + request.host_with_port
  end
  # def render_gravatar( email, size, default )
  #     @gravatar_email = Digest::MD5.hexdigest( email )
  #     url = "http://www.gravatar.com/avatar.php?gravatar_id=#{@gravatar_email}"?default=/images/avatar.png"
  #   end

end
