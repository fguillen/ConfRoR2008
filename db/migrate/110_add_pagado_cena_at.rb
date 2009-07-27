class AddPagadoCenaAt < ActiveRecord::Migration
  def self.up
    add_column :usuarios, :pagado_cena_at, :datetime
  end

  def self.down
    remove_column :usuarios, :pagado_cena_at
  end
end
