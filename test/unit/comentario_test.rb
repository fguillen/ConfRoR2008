require File.dirname(__FILE__) + '/../test_helper'

class ComentarioTest < Test::Unit::TestCase
  
  def setup
  end
  
  def test_valid_fixtures
    Comentario.find(:all).each do |element|
      assert element.valid?
    end
    assert_equal( 2, Comentario.count )
  end
  
  def test_validations
    @element = Comentario.create()
    
    assert( @element.errors[:usuario_id] )
    assert( @element.errors[:charla_id] )
    assert( @element.errors[:texto] )
    
    @element = 
      Comentario.create(
        :usuario_id => 1, 
        :charla_id => 1,
        :texto => ""
      )
    
    assert( !@element.errors[:usuario_id] )
    assert( !@element.errors[:charla_id] )
    assert( @element.errors[:texto] )
    

    
    @element = 
      Comentario.new(
        :usuario_id => 1, 
        :charla_id => 2,
        :texto => "el texto"
      )
    
    assert( @element.save )
  end
  
  def test_on_create_update_fields
    @comentario = comentarios(:comentario_01)
    @element =
      Comentario.new( 
        :usuario_id => @comentario.usuario_id, 
        :charla_id => @comentario.charla_id,
        :texto => @comentario.texto
      )
      
    assert( @element.save )
    assert_not_nil( @element.created_at )
    assert_equal( @comentario.usuario_id, @element.usuario_id )
    assert_equal( @comentario.charla_id, @element.charla_id )
    assert_equal( @comentario.texto, @element.texto )
  end
  
  def test_comentarios_count_por_estado
    @charla = charlas(:charla_de_jaime)
    assert_equal(0, @charla.comentarios.size)
    assert_equal(0, @charla.comentarios_publicados.size)
    
    Comentario.create!(
      :usuario_id => 1, 
      :charla_id => @charla.id,
      :texto => "este es el texto"
    )
    
    @charla.reload
    assert_equal(1, @charla.comentarios.size)
    assert_equal(1, @charla.comentarios_publicados.size)
    
    @comentario = 
      Comentario.create!(
        :usuario_id => 1, 
        :charla_id => @charla.id,
        :texto => "este es el texto"
      )
    
    @charla.reload
    assert_equal(2, @charla.comentarios.size)
    assert_equal(2, @charla.comentarios_publicados.size)
    
    @comentario.update_attributes!(
      :estado => Comentario::BORRADO
    )
    
    @charla.reload
    assert_equal(2, @charla.comentarios.size)
    assert_equal(1, @charla.comentarios_publicados.size)
  end
  
  def test_update_at
    @comentario = comentarios(:comentario_01)
    pass = @comentario.updated_at
    @comentario.estado = Comentario::BORRADO
    @comentario.save
    
    assert_not_equal( pass, @comentario.updated_at )
  end

end