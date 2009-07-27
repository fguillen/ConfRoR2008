class AddFacturacion < ActiveRecord::Migration
  def self.up
    add_column :perfiles, :facturacion, :text
  end

  def self.down
    remove_column :perfiles, :facturacion
  end
end
