class CreateAutores < ActiveRecord::Migration
  def self.up
    create_table :autores do |t|
      t.column :nombre, :string, :default => "", :null => false
      t.column :apellidos, :string, :default => "", :null => false      
      t.column :resumen, :text, :null => false      
      t.column :web, :string, :default => "", :null => false    
      t.column :email, :string, :default => "", :null => false          
    end
    
    create_table("autores_charlas", :id => false) do |t|
      t.column "autor_id", :integer
      t.column "charla_id", :integer         
    end      
  end

  def self.down
    drop_table :autores
    drop_table :autores_charlas
  end
end
