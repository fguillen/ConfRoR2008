class CreateCharlas < ActiveRecord::Migration
  def self.up
    create_table :charlas do |t|
      t.column :titulo, :string, :default => "", :null => false
      t.column :resumen, :text, :null => false      
      t.column :fecha, :datetime, :null => true
      t.column :duracion, :integer, :default => 60, :null => false 
    end
  end

  def self.down
    drop_table :charlas
  end
end
