class Perfil < ActiveRecord::Base
  belongs_to :usuario
  
  validates_presence_of :nombre,
                        :message => 'El nombre no puede estar en blanco'
  validates_presence_of :apellido1,
                        :message => 'El primer apellido no puede estar en blanco'
    
end
