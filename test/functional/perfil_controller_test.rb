require File.dirname(__FILE__) + '/../test_helper'
require 'perfil_controller'

# Re-raise errors caught by the controller.
class PerfilController; def rescue_action(e) raise e end; end

class PerfilControllerTest < Test::Unit::TestCase
  def setup
    @controller = PerfilController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
