class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles, :force => true do |t|
      t.column :title, :string
    end
  end

  def self.down
    drop_table :roles
  end
end
