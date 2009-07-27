class Tarifa < ActiveRecord::Base
  
  has_many :usuarios
  
  def self.actual
    Tarifa.find(:first, :conditions => ['actual is not null'])
  end
  
end