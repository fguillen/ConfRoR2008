class ConfirmarCharlas < ActiveRecord::Migration
  def self.up
    add_column :charlas, :confirmada, :boolean, :default => false
  end

  def self.down
    remove_column :charlas, :confirmada
  end
end
