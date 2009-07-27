require File.dirname(__FILE__) + '/../test_helper'

class AsistenciasControllerTest < Test::Unit::TestCase
  
  # def setup
  #   @controller = BlogsController.new
  #   @request = ActionController::TestRequest.new
  #   @response = ActionController::TestResponse.new
  # end
  
  context "initialize" do
    setup do
      @controller = AsistenciasController.new
      @request    = ActionController::TestRequest.new
      @response   = ActionController::TestResponse.new
    end
    
    context "with not logged user" do
      setup do
        login_as nil
      end
    
      context "on AsistenciasController:voy_a_ir" do
        setup do
          @charla = charlas(:charla_christos_y_sergio)
          get( 
            :voy_a_ir,
            :charla_id => @charla.id
          )
        end
      
        should_respond_with 500
      end
      
      context "on AsistenciasController:no_voy_a_ir" do
        setup do
          @charla = charlas(:charla_christos_y_sergio)
          get( 
            :no_voy_a_ir,
            :charla_id => @charla.id
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
    
      context "on AsistenciasController:voy_a_ir" do
        setup do
          @charla = charlas(:charla_christos_y_sergio)
          get( 
            :voy_a_ir,
            :charla_id => @charla.id
          )
        end
        
        should_set_the_flash_to /asistencia añadida/i
        should_redirect_to "{:controller => 'charlas', :action => 'show'}"
        should_change "Asistencia.count", :by => 1
      end
      
      context "on AsistenciasController:no_voy_a_ir" do
         setup do
           @charla = charlas(:charla_de_xavi)
           login_as usuarios(:quentin)
           get( 
             :no_voy_a_ir,
             :charla_id => @charla.id
           )
         end
         
         should_set_the_flash_to /asistencia borrada/i
         should_redirect_to "{:controller => 'charlas', :action => 'show'}"
         should_change "Asistencia.count", :by => -1
       end
     end  # with logged user
  end # initialize
end