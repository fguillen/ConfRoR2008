class CreateComentarios < ActiveRecord::Migration
  def self.up
    create_table :comentarios do |t|
      t.column :usuario_id,   :integer, :null => false
      t.column :charla_id,    :integer, :null => false
      t.column :texto,        :text,    :null => false
      t.column :estado,       :string,  :default => Comentario::PUBLICADO
      t.column :created_at,   :datetime
      t.column :updated_at,   :datetime
    end
  end

  def self.down
    drop_table :comentarios
  end
end