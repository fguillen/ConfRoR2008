# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem

  session :session_key => 'conf_ror_id'
  
  before_filter :login_from_cookie


  
  def current_user
    current_usuario
  end
  
  def rescue_action_in_public(exception)
    render :file => "#{RAILS_ROOT}/public/error.html", :layout => true, :status => 404
  end
  
  def local_request?
    false
  end
  
  def expulsar_si_no_autenticado
    if !autenticado?
      redirect_to :controller => 'edicion/acceso'
    end
  end  
   
  private 
   
    def mydebug(text)
      logger.debug("registro #{Time.now.strftime("[%d/%b/%Y:%H:%M:%S %Z]")} #{text}")
    end
  

end
