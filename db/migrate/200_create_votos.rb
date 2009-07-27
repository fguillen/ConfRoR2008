class CreateVotos < ActiveRecord::Migration
  def self.up
    create_table :votos do |t|
      t.column :usuario_id,   :integer, :null => false
      t.column :charla_id,    :integer, :null => false
      t.column :puntos,       :integer, :null => false
      t.column :created_at,   :datetime
      t.column :updated_at,   :datetime
    end
  end

  def self.down
    drop_table :votos
  end
end
