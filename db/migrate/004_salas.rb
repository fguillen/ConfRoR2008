class Salas < ActiveRecord::Migration
  def self.up
    create_table :salas do |t|
      t.column :nombre, :string, :default => "", :null => false
    end  
  
    add_column :charlas, :sala_id, :integer
  end

  def self.down
    drop_table :salas
    remove_column :charlas, :sala_id
  end
end
