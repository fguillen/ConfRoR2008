require File.dirname(__FILE__) + '/../../test_helper'
require 'edicion/charlas_controller'

# Re-raise errors caught by the controller.
class Edicion::CharlasController; def rescue_action(e) raise e end; end

class Edicion::CharlasControllerTest < Test::Unit::TestCase
  fixtures :autores, :charlas, :autores_charlas, :usuarios

  def setup
    @controller = Edicion::CharlasController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    # simular login
    @usuario = usuarios(:quentin)
    @request.session[:usuario] = @usuario
    @current_usuario = @usuario

    @first_id = charlas(:charla_de_xavi).id
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

    assert_not_nil assigns(:charlas)
  end

  def test_show
    get :show, :id => @first_id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:charla)
    assert assigns(:charla).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:charla)
  end

  def test_create
    num_charlas = Charla.count

    post :create, :charla => {:titulo => 'Nuevo titulo',
                              :resumen => 'Nuevo resumen',
                              :autores => [Autor.find(:first)]}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_charlas + 1, Charla.count
  end

  def test_edit
    get :edit, :id => @first_id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:charla)
    assert assigns(:charla).valid?
  end

  def test_update
    post :update, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => @first_id
  end

  def test_destroy
    assert_nothing_raised {
      Charla.find(@first_id)
    }

    post :destroy, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Charla.find(@first_id)
    }
  end
end
