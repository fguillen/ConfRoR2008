class Charla < ActiveRecord::Base
  validates_presence_of :titulo, :resumen
  
  has_and_belongs_to_many :autores
  belongs_to :sala

  has_many  :comentarios,  :order => 'created_at ASC'
  
  has_many  :comentarios_publicados,
            :class_name => 'Comentario',
            :conditions => "estado = '#{Comentario::PUBLICADO}'", 
            :order => 'created_at ASC'
            
  has_many :votos
  
  has_many  :asistencias
  
  has_many  :asistentes,
            :source => :usuario,
            :through => :asistencias,
            :order => 'asistencias.created_at ASC'

  # fguillen: definitivamente no sé como hacer esto.. hago un método
  # has_many  :asistentes_publicos,
  #           :source => :usuario,
  #           :through => :asistencias,
  #           :order => 'asistencias.created_at ASC',
  #           :conditions => ['usuario.perfil.publico = ?', true]
  
  def self.por_sala_y_fecha(s, f)
    # Devuelve las charlas para una sala y fecha determinada
    Charla.find(:all, :conditions => "fecha = '#{f.to_s(:db)}' AND sala_id=#{s.id} AND aprobada=true")
  end
  
  def votos_media
    media = Voto.average(:puntos, :conditions => "charla_id = #{self.id}")
    if media.nil?
      media = 0
    end
    media
  end

  def necesita_td_izquierda
    self.sala.id == 2 && !Charla.find_by_sala_id_and_fecha(1, self.fecha)
  end
  
  # fguillen: trata de devolver la lista de asistentes que tienen perfil público
  # TODO: seguro que se puede optimizar este collect o delete_if con una query o algo
  def asistentes_publicos
    asistentes.delete_if { |a| !a.perfil.publico }
  end
  
end
