class Comentario < ActiveRecord::Base
  validates_presence_of     :usuario_id, :charla_id, :texto

  belongs_to :charla
  belongs_to :usuario
  
  PUBLICADO = 'publicado'
  BORRADO   = 'borrado'
end