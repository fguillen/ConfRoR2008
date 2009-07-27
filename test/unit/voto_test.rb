require File.dirname(__FILE__) + '/../test_helper'

class VotoTest < Test::Unit::TestCase
  
  def setup
    # @libro = libros(:libro01)
  end
  
  def test_valid_fixtures
    Voto.find(:all).each do |element|
      assert element.valid?
    end
    assert_equal( 2, Voto.count )
  end
  
  def test_validations
    @element = Voto.create()
    
    assert( @element.errors[:usuario_id] )
    assert( @element.errors[:charla_id] )
    assert( @element.errors[:puntos] )
    
    @element = 
      Voto.create(
        :usuario_id => 1, 
        :charla_id => 2,
        :puntos => "no numero"
      )
    
    assert( !@element.errors[:usuario_id] )
    assert( !@element.errors[:charla_id] )
    assert( @element.errors[:puntos] )
    
    @element = 
      Voto.new(
        :usuario_id => 1, 
        :charla_id => 1,
        :puntos => 1
      )
    
    assert( !@element.save, "ya hay una fixtura con este usuario/charla y no debería permitir grabar" )
    
    @element = 
      Voto.new(
        :usuario_id => 1, 
        :charla_id => 2,
        :puntos => 6
      )
    
    assert( !@element.save, "solo debe permitir puntos del 1 al 5" )
    
    @element = 
      Voto.new(
        :usuario_id => 1, 
        :charla_id => 2,
        :puntos => 0
      )
    
    assert( !@element.save, "solo debe permitir puntos del 1 al 5" )
    
    @element = 
      Voto.new(
        :usuario_id => 1, 
        :charla_id => 2,
        :puntos => 1
      )
    
    assert( @element.save )
  end
  
  def test_on_create_update_fields
    @element =
      Voto.new( 
        :usuario_id => 1, 
        :charla_id => 2,
        :puntos => 1
      )
      
    assert( @element.save )
    assert_not_nil( @element.created_at )
    assert_not_nil( @element.updated_at )
    assert_equal( 1, @element.usuario_id )
    assert_equal( 2, @element.charla_id )
    assert_equal( 1, @element.puntos )
  end
  
  def test_update_at
    @voto = votos(:voto_01)
    pass = @voto.updated_at
    @voto.puntos = 2
    @voto.save
    
    assert_not_equal( pass, @voto.updated_at )
  end
  
  def test_ha_votado_este_usuario_esta_charla
    @charla = charlas(:charla_de_dani)
    @usuario = usuarios(:quentin)
    
    assert( !Voto.ha_votado_este_usuario_esta_charla?( @usuario.id, @charla.id ) )
    
    Voto.create!( 
      :usuario_id => @usuario.id, 
      :charla_id => @charla.id,
      :puntos => 1
    )
    
    assert( Voto.ha_votado_este_usuario_esta_charla?( @usuario.id, @charla.id ) )
  end
  
  def test_votos_count
    @charla = charlas(:charla_de_xavi)
    assert_equal(2, @charla.votos.size)
    
    @charla = charlas(:charla_de_jaime)
    assert_equal(0, @charla.votos.size)
  end

  def test_votos_media
    @charla = charlas(:charla_de_xavi)
    assert_equal(1.5, @charla.votos_media)
    
    @charla = charlas(:charla_de_jaime)
    assert_equal(0, @charla.votos_media)
  end
end