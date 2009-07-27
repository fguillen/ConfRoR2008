require 'digest/sha1'
class Usuario < ActiveRecord::Base
  
  has_one :perfil, :dependent => :destroy
  belongs_to :tarifa
  has_and_belongs_to_many :roles do
    def include_admin?
      return find_by_title('admin').nil? ? false : true
    end
  end
  
  validates_associated :perfil
  
  # Virtual attribute for the unencrypted password
  attr_accessor :password

  validates_presence_of     :login,
                            :message => "El login no puede estar en blanco"
  validates_presence_of     :email,
                            :message => "El correo no puede estar en blanco"
  validates_format_of       :email, 
                            :with => %r{^((?:(?:(?:[a-zA-Z0-9][\.\-\+_!#%&\*|~=/^]?)*)[a-zA-Z0-9])+)\@((?:(?:(?:[a-zA-Z0-9][\.\-_]?){0,62})[a-zA-Z0-9])+)\.([a-zA-Z0-9]{2,6})$},
                            :message => "El correo no tiene un formato válido"
  validates_presence_of     :password,                   :if => :password_required?,
                            :message => 'Se requiere una contraseña'
  validates_presence_of     :password_confirmation,      :if => :password_required?,
                            :message => 'Se requiere confirmación de la contraseña'
  validates_length_of       :password, :within => 4..40, :if => :password_required?,
                            :too_short => 'La contraseña debe tener al menos %d caracteres',
                            :too_long  => 'La contraseña debe tener como máximo %d caracteres'
  validates_confirmation_of :password,                   :if => :password_required?,
                            :message => 'La contraseña y su confirmación no coinciden'
  validates_length_of       :login, :within => 3..40,
                            :too_short => 'El login debe tener al menos %d caracteres',
                            :too_long  => 'El login debe tener como máximo %d caracteres'
                            
  
  #validates_length_of       :email,    :within => 3..100
  validates_uniqueness_of   :login, :case_sensitive => false,
                            :message => 'El login escogido ya existe'
  validates_uniqueness_of   :email, :case_sensitive => false,
                            :message => 'El correo escogido ya existe'
                            
  before_save :encrypt_password
  before_create :make_activation_code 
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :login, :email, :password, :password_confirmation
  
  def nombre_completo
    n = self.perfil.nombre + " " + self.perfil.apellido1
    unless self.perfil.apellido2.empty?
      n = n + " " + self.perfil.apellido2
    end
    return n
  end
  
  def self.find_by_role(role_title)
    find(:all, :conditions => ["roles.title = ?", role_title], :include => :roles)
  end
  
  def self.noactivados
    Usuario.find(:all, :conditions => {:activated_at => nil})
  end
  
  def self.activados
    Usuario.find(:all, :conditions => ['activated_at is not null'])
  end
  
  def self.nopagados
    Usuario.find(:all, :conditions => ['pagado_at is null'])
  end
  
  #def self.pagados
  #  Usuario.find(:all, :conditions => ['pagado_at is not null and pagado_cena_at is not null'])
  #end
  
  def self.publicos
    find(:all, :conditions => ["perfiles.publico = ? and activated_at is not null", true], :include => :perfil)
  end
  
  def self.cena
    find(:all, :conditions => ["perfiles.cena = ? and activated_at is not null", true], :include => :perfil)
  end
  
  # Activates the user in the database.
  def activate
    @activated = true
    self.activated_at = Time.now.utc
    self.activation_code = nil
    save(false)
  end

  def activated?
    # the existence of an activation code means they have not activated yet
    activation_code.nil?
  end
  
  def pagado?
    !pagado_at.nil?
  end
  
  def pagado_cena?
    !pagado_cena_at.nil?
  end
  
  def cena?
    self.perfil.cena
  end
  
  def todo_pagado?
    cena? ? (pagado? && pagado_cena?) : pagado?
  end
  
  def pagado
    @pagado = true
    self.pagado_at = Time.now.utc
    save
  end
  
  def nopagado
    @nopagado = true
    self.pagado_at = nil
    save
  end

  def pagadocena
    @pagadocena = true
    self.pagado_cena_at = Time.now.utc
    save
  end
  
  def nopagadocena
    @nopagadocena = true
    self.pagado_cena_at = nil
    save
  end

  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  def self.authenticate(login, password)
    u = find :first, :conditions => ['login = ? and activated_at IS NOT NULL', login] # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  # Encrypts some data with the salt.
  def self.encrypt(password, salt)
    Digest::SHA1.hexdigest("--#{salt}--#{password}--")
  end

  # Encrypts the password with the user salt
  def encrypt(password)
    self.class.encrypt(password, salt)
  end

  def authenticated?(password)
    crypted_password == encrypt(password)
  end

  def remember_token?
    remember_token_expires_at && Time.now.utc < remember_token_expires_at 
  end

  #These create and unset the fields required for remembering users between browser closes
  def remember_me
    remember_me_for 2.weeks
  end

  def remember_me_for(time)
    remember_me_until time.from_now.utc
  end

  def remember_me_until(time)
    self.remember_token_expires_at = time
    self.remember_token            = encrypt("#{email}--#{remember_token_expires_at}")
    save(false)
  end

  def forget_me
    self.remember_token_expires_at = nil
    self.remember_token            = nil
    save(false)
  end
  
  def forgot_password
    @forgotten_password = true
    self.make_password_reset_code
  end
  
  def new_password
    @new_password = true
    self.new_random_password
    self.password_reseted_at = Time.now.utc
    self.password_reset_code = nil
  end

  # Returns true if the user has just been activated.
  def recently_activated?
    @activated
  end  
  
  def recently_forgot_password?
    @forgotten_password
  end
  
  def recently_new_password?
    @new_password
  end
  
  def recently_pagado?
    @pagado
  end

  def recently_nopagado?
    @nopagado
  end

  def recently_pagadocena?
    @pagadocena
  end

  def recently_nopagadocena?
    @nopagadocena
  end


  protected
    # before filter 
    def encrypt_password
      return if password.blank?
      self.salt = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{login}--") if new_record?
      self.crypted_password = encrypt(password)
    end
    
    def password_required?
      crypted_password.blank? || !password.blank?
    end
    
    def make_activation_code
      self.activation_code = create_code
    end 
    
    def make_password_reset_code
      self.password_reset_code = create_code
    end
    
    def create_code
      Digest::SHA1.hexdigest( Time.now.to_s.split(//).sort_by {rand}.join )
    end
    
    def new_random_password
      self.password= Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{login}--")[0,6]
      self.password_confirmation = self.password
    end
    
end
