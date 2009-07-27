class CreateTarifas < ActiveRecord::Migration
  def self.up
    create_table :tarifas do |t|
      t.column :importe, :integer
      t.column :actual,  :boolean
    end
  end

  def self.down
    drop_table :tarifas
  end
end
