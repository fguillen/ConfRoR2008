class CreatePerfiles < ActiveRecord::Migration
  def self.up
    create_table :perfiles do |t|
      t.column :nombre, :string
      t.column :apellido1, :string
      t.column :apellido2, :string
      t.column :telefono, :string
      t.column :empresa, :string
      t.column :url_empresa, :string
      t.column :titulo_blog, :string
      t.column :url_blog, :string
      t.column :cena, :boolean
      t.column :publico, :boolean
      t.column :usuario_id, :integer
    end
  end

  def self.down
    drop_table :perfiles
  end
end
