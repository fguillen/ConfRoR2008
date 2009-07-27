require File.dirname(__FILE__) + '/../test_helper'
require 'charlas_controller'

# Re-raise errors caught by the controller.
class CharlasController; def rescue_action(e) raise e end; end

class CharlasControllerTest < Test::Unit::TestCase
  fixtures :autores, :charlas, :autores_charlas

  def setup
    @controller = CharlasController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @first_id = charlas(:charla_de_xavi).id
  end

  def test_index
    get :index
    assert_redirected_to :action => :calendario
  end

  def test_list
    get :list

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:charlas)
  end

  def test_show
    get :show, :id => @first_id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:charla)
    assert assigns(:charla).valid?
  end

  
  # fguillen
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
    
      context "on CharlasController:mi_calendario" do
        setup do
          get( :mi_calendario )
        end
        should_respond_with 500
      end
    end # with not logged user
  
    context "with logged user" do
      setup do
        @usuario = usuarios(:aaron)
        login_as @usuario
      end
    
      # context "on CharlasController:mi_calendario" do
      #   setup do
      #     get( :mi_calendario )
      #   end
      #   should_render_template :mi_calendario
      #   # should_assign_to :salas
      #   # should_assign_to :charlas
      #   # should_assign_to :fechas
      # end
    end # with logged user
  end
    
end
