require File.dirname(__FILE__) + '/../test_helper'

class AutorTest < Test::Unit::TestCase
  def test_crear
    # Creamos un autor nuevo con todos sus campos
    pepe = Autor.create(:nombre => 'Pepe',
                        :apellidos => 'Pérez Solano',
                        :resumen => 'El resumen de Pepe',
                        :web => 'http://www.pepe.com',
                        :email => 'pepe@pepe.com')
    assert_equal 'Pepe', pepe.nombre
    assert_equal 'Pérez Solano', pepe.apellidos
    assert_equal 'Pepe Pérez Solano', pepe.nombre_y_apellidos    
    assert_equal 'El resumen de Pepe', pepe.resumen
    assert_equal 'http://www.pepe.com', pepe.web
    assert_equal 'pepe@pepe.com', pepe.email
  end
  
  def test_crear_sin_nombre_ni_apellidos
    # No se permite guardar un autor sin nombre ni apellidos
    pepe = Autor.new
    assert_equal false, pepe.save
    assert_equal 2, pepe.errors.size
    assert pepe.errors.on(:nombre)
    assert pepe.errors.on(:apellidos)
  end  
end
