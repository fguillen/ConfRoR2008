class NotasEnCharlasYAutores < ActiveRecord::Migration
  def self.up
    add_column :charlas, :notas, :text
    add_column :autores, :notas, :text
  end

  def self.down
    remove_column :charlas, :notas
    remove_column :autores, :notas
  end
end
