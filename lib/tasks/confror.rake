namespace :confror do
  desc "Borrar tablas catálogo"
  task( :delete_catalog_tables => :environment ) do
    puts "environment: #{RAILS_ENV}"
    Tarifa.delete_all
    Role.delete_all
  end
end