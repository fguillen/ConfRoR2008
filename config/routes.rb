ActionController::Routing::Routes.draw do |map|
  map.connect '', :controller => "charlas"
  
  
  ### REGISTRO:INI ###
  map.resources :usuarios, 
                 :collection => {:noactivados   => :get,
                                 :activados     => :get,
                                 :nopagados     => :get,
                                 :cena          => :get},
                 :member     => {:pagado        => :post,
                                 :nopagado      => :post,
                                 :pagadocena    => :post,
                                 :nopagadocena  => :post,
                                 :editar_tarifa => :any } do |usuario|
     usuario.resource  :perfil
   end   

   map.resources :emails

   map.connect '/usuarios/role/:role_title', 
                          :controller => 'usuarios', :action => 'index',
                          :conditions => { :method => :get }
   #DELETE /usuarios/:usuario_id/roles/:id/ {:action=>"destroy", :controller=>"roles"}
   #POST   /usuarios/:usuario_id/roles/:id/ {:action=>"create", :controller=>"roles"}                      
   map.connect '/usuarios/:usuario_id/roles/:id',
                          :controller => 'roles', :action => 'destroy',
                          :conditions => { :method => :delete }
   map.connect '/usuarios/:usuario_id/roles/:id',
                          :controller => 'roles', :action => 'create',
                          :conditions => { :method => :post }

   map.resource  :sesion

   map.activa '/activa/:activation_code', :controller => 'usuarios', :action => 'activate'

   map.signup '/registro',  :controller => 'usuarios', :action => 'new'
   map.login  '/entrar',   :controller => 'sesion',   :action => 'new'
   map.logout '/salir',  :controller => 'sesion',   :action => 'destroy'

   map.reset '/reset', :controller => 'usuarios', :action => 'reset'
   map.reset_password '/reset_password/:password_reset_code', :controller => 'usuarios', :action => 'reset_password'

   map.instrucciones '/instrucciones', :controller => 'presentacion',   :action => 'show'
   map.asistentes '/asistentes', :controller => 'presentacion',   :action => 'asistentes'
  ### REGISTRO:END ###  
  
  
  # Castellanizacion de rutas
  map.connect ':controller/lista', :action => 'list'
  map.connect ':controller/ver/:id', :action => 'show'  
  
  
  
  

  # Allow downloading Web Service WSDL as a file with an extension
  # instead of a file named 'wsdl'
  map.connect ':controller/service.wsdl', :action => 'wsdl'

  # Install the default route as the lowest priority.
  map.connect ':controller/:action/:id.:format'
  map.connect ':controller/:action/:id'
end
