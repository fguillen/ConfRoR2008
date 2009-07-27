require File.dirname(__FILE__) + '/../test_helper'
require 'autores_controller'

# Re-raise errors caught by the controller.
class AutoresController; def rescue_action(e) raise e end; end

class AutoresControllerTest < Test::Unit::TestCase
  fixtures :autores

  def setup
    @controller = AutoresController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

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

end
