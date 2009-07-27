class Avatar < ActiveRecord::Migration
  def self.up
    add_column :autores, :avatar, :string
  end

  def self.down
    remove_column :autores, :avatar 
  end
end
