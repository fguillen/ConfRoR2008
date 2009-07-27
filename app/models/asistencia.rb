class Asistencia < ActiveRecord::Base
  validates_presence_of     :usuario_id, :charla_id
  validates_uniqueness_of   :charla_id, :scope => :usuario_id

  belongs_to :charla
  belongs_to :usuario
  
  def self.asiste_este_usuario_a_esta_charla?(usuario_id, charla_id)
    Asistencia.count( :conditions => "usuario_id = #{usuario_id} and charla_id = #{charla_id}" ) > 0
  end
end