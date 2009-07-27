class Autor < ActiveRecord::Base
  validates_presence_of :nombre, :apellidos

  has_and_belongs_to_many :charlas
  
  file_column :avatar
  
  def nombre_y_apellidos
    "#{nombre} #{apellidos}"
  end
  
end
