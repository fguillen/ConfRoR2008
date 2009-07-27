class CreateRolesUsuarios < ActiveRecord::Migration
  def self.up
    create_table :roles_usuarios, :id => false, :force => true do |t|
      t.column :role_id, :integer
      t.column :usuario_id, :integer
    end
  end

  def self.down
    drop_table :roles_usuarios
  end
end
