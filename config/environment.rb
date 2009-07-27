# Be sure to restart your web server when you modify this file.

# Uncomment below to force Rails into production mode when 
# you don't control web/app server and can't set it the proper way
ENV['RAILS_ENV'] ||= 'production'

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '1.2.3' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  # Settings in config/environments/* take precedence over those specified here
  
  # Skip frameworks you're not going to use (only works if using vendor/rails)
  # config.frameworks -= [ :action_web_service, :action_mailer ]

  # Only load the plugins named here, by default all plugins in vendor/plugins are loaded
  # config.plugins = %W( exception_notification ssl_requirement )

  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )

  # Force all environments to use the same logger level 
  # (by default production uses :info, the others :debug)
  # config.log_level = :debug

  # Use the database for sessions instead of the file system
  # (create the session table with 'rake db:sessions:create')
  # config.action_controller.session_store = :active_record_store

  # Use SQL instead of Active Record's schema dumper when creating the test database.
  # This is necessary if your schema can't be completely dumped by the schema dumper, 
  # like if you have constraints or database-specific column types
  # config.active_record.schema_format = :sql

  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector

  # Make Active Record use UTC-base instead of local time
  # config.active_record.default_timezone = :utc
  
  # See Rails::Configuration for more options
  config.active_record.observers = :usuario_observer
end

# Add new inflection rules using the following format 
# (all these examples are active by default):
# Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end

Inflector.inflections do |inflect|
  inflect.plural /(on)$/i, '\1es'
  inflect.singular /(on)es/i, '\1'

  inflect.plural /(or)$/i, '\1es'
  inflect.singular /(or)es/i, '\1'

  inflect.plural /(en)$/i, '\1es'
  inflect.singular /(en)es/i, '\1'  

  inflect.plural /(ad)$/i, '\1es'
  inflect.singular /(ad)es/i, '\1'
  
  inflect.plural /(il)$/i, '\1es'
  inflect.singular /(il)es$/, '\1'
  inflect.irregular 'email', 'emails'
end

# Haml settings
Haml::Template.options[:attr_wrapper] = '"'
# Sass settings
# Sass::Plugin.options[:style] = :compact
# Sass::Plugin.options[:css_location] = RAILS_ROOT + "/public/stylesheets/lib"
# Sass::Plugin.options[:template_location] = RAILS_ROOT + "/public/stylesheets"

# Add new mime types for use in respond_to blocks:
# Mime::Type.register "text/richtext", :rtf
# Mime::Type.register "application/x-mobile", :mobile

# Include your application configuration below

# DE REGISTRO APP
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  "<span class=\"fieldWithErrors\">#{html_tag}</span>"
end

class ActionView::Base
  
      def error_messages_for(*params)
        options = params.last.is_a?(Hash) ? params.pop.symbolize_keys : {}
        objects = params.collect {|object_name| instance_variable_get("@#{object_name}") }.compact
        count   = objects.inject(0) {|sum, object| sum + object.errors.count }
        unless count.zero?
          html = {}
          [:id, :class].each do |key|
            if options.include?(key)
              value = options[key]
              html[key] = value unless value.blank?
            else
              html[key] = 'errorExplanation'
            end
          end
          header_message = "#{pluralize(count, 'error')} prohibited this #{(options[:object_name] || params.first).to_s.gsub('_', ' ')} from being saved"
          error_messages = objects.map {|object| object.errors.full_messages.map {|msg| content_tag(:li, msg) } }
          content_tag(:div,
              #content_tag(options[:header_tag] || :h2, header_message) <<
              content_tag(:p, 'Existen problemas con los siguientes campos:') <<
              content_tag(:ul, error_messages),
            html
          )
        else
          ''
        end
      end
end

class ActiveRecord::Errors
    def full_messages
      full_messages = []
      @errors.each_key do |attr|
        @errors[attr].each do |msg|
          next if msg.nil?
          full_messages << msg
        end
      end
      full_messages
    end
end
  
#ActionMailer::Base.smtp_settings = {
#  :address        => "mail.zanaguara.net",
#  :port           => 25,
#  :domain         => "zanaguara.net",
#  :authentication => :login,
#  :user_name      => 'm6127549',
#  :password       => 'tnitc007'
#}

# fguillen 2008-09-22: paso esto al config/environmets/production
# ActionMailer::Base.delivery_method = :smtp 
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.default_content_type = "text/html"
ActionMailer::Base.default_charset = "utf-8"
#ActionMailer::Base.server_settings = {
#  :address => "smtp.gmail.com",
#  :port => "587",
#  :domain => "correo.zanaguara.net",
#  :authentication => :plain,
#  :user_name => "hola@correo.zanaguara.net",
#  :password => "ror6427"
#}
#require 'smtp_tls'
ActionMailer::Base.server_settings = {
  :address => "localhost",
  :port => "25",
  :domain => "conferenciarails.org"
}
