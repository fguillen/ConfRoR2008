require File.dirname(__FILE__) + '/../test_helper'

class VotosControllerTest < Test::Unit::TestCase
  
  context "initialize" do
    setup do
      @controller = VotosController.new
      @request    = ActionController::TestRequest.new
      @response   = ActionController::TestResponse.new
    end
    
    context "with not logged user" do
      setup do
        login_as nil
      end
    
      context "on VotosController:votar" do
        setup do
          @charla = charlas(:charla_christos_y_sergio)
          get( 
            :votar,
            :charla_id => @charla.id,
            :puntos => 2
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
    
      context "on VotosController:votar" do
        setup do
          @charla = charlas(:charla_christos_y_sergio)
          get( 
            :votar,
            :charla_id => @charla.id,
            :puntos => 2
          )
        end
        
        should_set_the_flash_to /voto enviado/i
        should_redirect_to "{:controller => 'charlas', :action => 'show'}"
        should_change "Voto.count", :by => 1
      end
      
      context "on VotosController:votar with error" do
        setup do
          @charla = charlas(:charla_christos_y_sergio)
          get( 
            :votar,
            :charla_id => @charla.id
          )
        end
        
        should_not_set_the_flash
        should_redirect_to "{:controller => 'charlas', :action => 'show'}"
        should_change "Voto.count", :by => 0
      end
      
      context "on VotosController:votar already existis" do
        setup do
          @charla = charlas(:charla_de_xavi)
          get( 
            :votar,
            :charla_id => @charla.id,
            :puntos => 2
          )
        end
        
        should_set_the_flash_to /voto enviado/i
        should_redirect_to "{:controller => 'charlas', :action => 'show'}"
        should_change "Voto.count", :by => 0
      end
      
      context "on VotosController:votar with bad charla_id" do
        setup do
          get( 
            :votar,
            :charla_id => 123,
            :puntos => 2
          )
        end
        
        should_respond_with 500
      end
    end  # with logged user
  end # initialize
end