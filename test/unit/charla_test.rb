require File.dirname(__FILE__) + '/../test_helper'

class CharlaTest < Test::Unit::TestCase

  def test_crear
    # Creamos una charla nueva con todos sus campos,
    # asociada al autor "Xavi"  
    xavi = Autor.find_by_nombre_and_apellidos('Xavier', 'Noria')
    charla = Charla.create( :titulo => 'El título de la charla',
                            :resumen => 'El resumen de la charla',
                            :fecha => Time.now.to_s,
                            :duracion => 60,
                            :autores => [xavi])
    assert_equal 'El título de la charla', charla.titulo
    assert_equal 'El resumen de la charla', charla.resumen
    assert_equal Time.now.year, charla.fecha.year
    assert_equal 'Xavier', charla.autores[0].nombre
  end
  
  def test_crear_sin_titulo_ni_resumen
    # No se permite guardar una charla sin titulo ni resumen
    charla = Charla.new
    assert_equal false, charla.save
    assert_equal 2, charla.errors.size
    assert charla.errors.on(:titulo)
    assert charla.errors.on(:resumen)
  end   

end
