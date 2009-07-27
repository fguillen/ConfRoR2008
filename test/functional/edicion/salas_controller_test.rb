require File.dirname(__FILE__) + '/../../test_helper'
require 'edicion/salas_controller'

# Re-raise errors caught by the controller.
class Edicion::SalasController; def rescue_action(e) raise e end; end

class Edicion::SalasControllerTest < Test::Unit::TestCase
  fixtures :salas, :usuarios

  def setup
    @controller = Edicion::SalasController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    # simular login
    @usuario = usuarios(:quentin)
    @request.session[:usuario] = @usuario
    @current_usuario = @usuario

    @first_id = salas(:uno).id
  end

  def test_index
    get :index
    assert_response :success
    assert_template 'list'
  end

  def test_list
    get :list

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:salas)
  end

  def test_show
    get :show, :id => @first_id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:sala)
    assert assigns(:sala).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:sala)
  end

  def test_create
    num_salas = Sala.count

    post :create, :sala => {:nombre => 'Nueva sala'}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_salas + 1, Sala.count
  end

  def test_edit
    get :edit, :id => @first_id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:sala)
    assert assigns(:sala).valid?
  end

  def test_update
    post :update, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => @first_id
  end

  def test_destroy
    assert_nothing_raised {
      Sala.find(@first_id)
    }

    post :destroy, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Sala.find(@first_id)
    }
  end
end
