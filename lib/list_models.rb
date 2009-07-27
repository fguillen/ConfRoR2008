ActiveRecord::Base.connection.tables.each do |model|
  begin
    puts model
    puts model.classify
    "#{model.classify}".constantize.find(:all)
  rescue Exception
    nil
  end
end

Dir["#{RAILS_ROOT}/app/models/**/*.rb"].each do |m|
 class_name = m.sub(/\.rb$/,'').camelize
 klass = class_name.split('::').inject(Object){ |klass,part|
klass.const_get(part) }
 self.find(:all) if klass < ActiveRecord::Base && !klass.abstract_class?
 
 
 Dir["#{RAILS_ROOT}/app/models/**/*.rb"].each do |m|
   class_name = m.sub(/\.rb$/,'').camelize
   klass = class_name.split('::').inject(Object){ |klass,part| klass.const_get(part) }
   self.find(:all) if klass < ActiveRecord::Base && !klass.abstract_class?
 end
