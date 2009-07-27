require File.dirname(__FILE__) + '/../test_helper'
require 'presentacion_controller'

# Re-raise errors caught by the controller.
class PresentacionController; def rescue_action(e) raise e end; end

class PresentacionControllerTest < Test::Unit::TestCase
  def setup
    @controller = PresentacionController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
