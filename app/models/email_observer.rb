class EmailObserver < ActiveRecord::Observer
  
  def after_create(email)
    EmailMailer.deliver_email(email)
  end

end