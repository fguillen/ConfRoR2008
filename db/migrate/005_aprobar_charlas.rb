class AprobarCharlas < ActiveRecord::Migration
  def self.up
    add_column :charlas, :aprobada, :boolean, :default => false
  end

  def self.down
    remove_column :charlas, :aprobada
  end
end
