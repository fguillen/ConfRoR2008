class LoadTarifas < ActiveRecord::Migration
  def self.up
    down

    tarifa = Tarifa.create(:importe => 75,
                           :actual  => true)
    tarifa.save!
    
  end

  def self.down
    Tarifa.delete_all
  end
end
