require File.dirname(__FILE__) + '/../test_helper'

class ComentariosControllerTest < Test::Unit::TestCase
  
  # def setup
  #   @controller = BlogsController.new
  #   @request = ActionController::TestRequest.new
  #   @response = ActionController::TestResponse.new
  # end
  
  context "initialize" do
    setup do
      @controller = ComentariosController.new
      @request    = ActionController::TestRequest.new
      @response   = ActionController::TestResponse.new
    end
    
    context "with not logged user" do
      setup do
        login_as nil
      end
    
      context "on ComentariosController:comentar" do
        setup do
          @charla = charlas(:charla_christos_y_sergio)
          get( 
            :comentar,
            :comentario => {
              :charla_id => @charla.id,
              :texto => "este es el texto"
            }
          )
        end
      
        should_respond_with 500
      end
    end  # with not logged user
    
    
    
    context "with logged user" do
      setup do
        @usuario = usuarios(:aaron)
        login_as @usuario
      end
    
      context "on ComentariosController:comentar" do
        setup do
          @charla = charlas(:charla_christos_y_sergio)
          get( 
            :comentar,
            :comentario => {
              :charla_id => @charla.id,
              :texto => "este es el texto"
            }
          )
        end
        
        should_set_the_flash_to /comentario enviado/i
        should_redirect_to "{:controller => 'charlas', :action => 'show'}"
      end
      
      context "on ComentariosController:comentar with error" do
        setup do
          @charla = charlas(:charla_christos_y_sergio)
          get( 
            :comentar,
            :comentario => {
              :charla_id => @charla.id
            }
          )
        end
        
        should_not_set_the_flash
        should_redirect_to "{:controller => 'charlas', :action => 'show'}"
      end
    end  # with logged user
  end # initialize
end