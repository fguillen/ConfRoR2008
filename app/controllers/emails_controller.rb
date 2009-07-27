class EmailsController < ApplicationController
  
  access_control :DEFAULT => 'admin'
  observer :email_observer
  
  before_filter :login_required
  
  def index
    @emails = Email.find(:all)
  end
  
  # Render new.rhtml
  def new
  end
  
  def create
    @email = Email.new(params[:email])
    @email.sent_on = Time.now.utc
    @email.from = "registro@conferenciarails.org"
    @email.save!
    redirect_to emails_path
      rescue ActiveRecord::RecordInvalid
      render :action => 'new'
  end
  
  def show
    @email = Email.find(params[:id])
  end
  
end
