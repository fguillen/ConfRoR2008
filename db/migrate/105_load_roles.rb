class LoadRoles < ActiveRecord::Migration
  def self.up
    down

    roles = %w{admin organizador asistente ponente}
    roles.each do |role_title|
      role = Role.create(:title => role_title)
      role.save!
    end

  end

  def self.down
    
    Role.delete_all
    
  end
end
