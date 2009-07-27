require File.dirname(__FILE__) + '/../test_helper'

class AsistenciaTest < Test::Unit::TestCase
  
  def setup
  end
  
  def test_valid_fixtures
    Asistencia.find(:all).each do |element|
      assert element.valid?
    end
    assert_equal( 1, Asistencia.count )
  end
  
  def test_validations
    @element = Asistencia.create()
    
    assert( @element.errors[:usuario_id] )
    assert( @element.errors[:charla_id] )
    
    @element = 
      Asistencia.create(
        :usuario_id => 1, 
        :charla_id => 2
      )
    
    assert( !@element.errors[:usuario_id] )
    assert( !@element.errors[:charla_id] )
    
    @element = 
      Asistencia.new(
        :usuario_id => 1, 
        :charla_id => 1
      )
    
    assert( !@element.save, "ya hay una asistencia con este usuario/charla y no debería permitir grabar" )
    
    @element = 
      Asistencia.new(
        :usuario_id => 2, 
        :charla_id => 2
      )
    
    assert( @element.save! )
  end
  
  def test_on_create_update_fields
    @element =
      Asistencia.new( 
        :usuario_id => 1, 
        :charla_id => 2
      )
      
    assert( @element.save )
    assert_not_nil( @element.created_at )
    assert_equal( 1, @element.usuario_id )
    assert_equal( 2, @element.charla_id )
  end
  
  def test_asiste_este_usuario_a_esta_charla
    @charla = charlas(:charla_de_dani)
    @usuario = usuarios(:quentin)
    
    assert( !Asistencia.asiste_este_usuario_a_esta_charla?( @usuario.id, @charla.id ) )
    
    Asistencia.create!( 
      :usuario_id => @usuario.id, 
      :charla_id => @charla.id
    )
    
    assert( Asistencia.asiste_este_usuario_a_esta_charla?( @usuario.id, @charla.id ) )
  end
  
  def test_charla_asistentes
    @charla = charlas(:charla_de_xavi)
    @usuario = usuarios(:aaron)
    
    assert_equal( 1, @charla.asistentes.size )
    
    Asistencia.create!(
      :usuario_id => @usuario.id, 
      :charla_id => @charla.id
    )
    
    @charla.reload
    assert_equal( 2, @charla.asistentes.size )
  end
  
  def test_charla_asistentes_publicos
    @charla = charlas(:charla_de_xavi)
    @usuario = usuarios(:aaron)
    
    assert_equal( 1, @charla.asistentes_publicos.size )
    
    Asistencia.create!(
      :usuario_id => @usuario.id, 
      :charla_id => @charla.id
    )
    
    @charla.reload
    assert_equal( 1, @charla.asistentes_publicos.size )
    
    @usuario.perfil.publico = true
    @usuario.perfil.save!
    @charla.reload
    assert_equal( 2, @charla.asistentes_publicos.size )
  end
end