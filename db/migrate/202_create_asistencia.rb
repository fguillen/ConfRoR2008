class CreateAsistencia < ActiveRecord::Migration
  def self.up
    create_table :asistencias do |t|
      t.column :usuario_id,   :integer, :null => false
      t.column :charla_id,    :integer, :null => false
      t.column :created_at,   :datetime
    end
  end

  def self.down
    drop_table :asistencias
  end
end