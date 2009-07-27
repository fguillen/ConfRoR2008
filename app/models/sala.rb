class Sala < ActiveRecord::Base
  validates_presence_of :nombre
  validates_uniqueness_of :nombre
  
  has_many :charlas
end
