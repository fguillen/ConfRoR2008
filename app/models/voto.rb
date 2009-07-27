class Voto < ActiveRecord::Base
  validates_presence_of     :usuario_id, :charla_id, :puntos
  validates_uniqueness_of   :charla_id, :scope => :usuario_id
  validates_numericality_of :puntos
  validates_inclusion_of    :puntos, :in => 1..5

  belongs_to :charla
  belongs_to :usuario
  
  def self.ha_votado_este_usuario_esta_charla?(usuario_id, charla_id)
    Voto.count( :conditions => "usuario_id = #{usuario_id} and charla_id = #{charla_id}" ) > 0
  end
  
  # def self.valoracion_de_este_usuario_a_esta_charla( usuario_id, charla_id )
  #   voto = Voto.find_by_usuario_id_and_charla_id( usuario_id, charla_id )    
  # end
end
