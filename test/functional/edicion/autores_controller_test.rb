require File.dirname(__FILE__) + '/../../test_helper'
require 'edicion/autores_controller'

# Re-raise errors caught by the controller.
class Edicion::AutoresController; def rescue_action(e) raise e end; end

class Edicion::AutoresControllerTest < Test::Unit::TestCase
  # fixtures :autores, :charlas, :autores_charlas, :usuarios, :roles, :roles_usuarios
  

  def setup  
    @controller = Edicion::AutoresController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    # # simular login
    # @usuario = usuarios(:quentin)
    # @request.session[:usuario] = @usuario
    # @current_usuario = @usuario
    
    login_as( usuarios(:quentin) )
    
    @first_id = autores(:xavi).id
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

    assert_not_nil assigns(:autores)
  end

  def test_show
    get :show, :id => @first_id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:autor)
    assert assigns(:autor).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:autor)
  end

  def test_create
    num_autores = Autor.count

    post :create, :autor => {:resumen => 'este es el resumen', :nombre => 'Jose Luis', :apellidos => 'Moreno'}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_autores + 1, Autor.count
  end

  def test_edit
    get :edit, :id => @first_id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:autor)
    assert assigns(:autor).valid?
  end

  def test_update
    post :update, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => @first_id
  end

  def test_destroy
    assert_nothing_raised {
      Autor.find(@first_id)
    }

    post :destroy, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Autor.find(@first_id)
    }
  end
end
