class Email < ActiveRecord::Base

  validates_presence_of :subject,
                        :message => 'El subject no puede estar en blanco'
  validates_presence_of :body,
                        :message => 'El mensaje no puede estar en blanco'
  
end
