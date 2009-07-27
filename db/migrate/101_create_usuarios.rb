class CreateUsuarios < ActiveRecord::Migration
  def self.up
    create_table "usuarios", :force => true do |t|
      t.column :login,                     :string
      t.column :email,                     :string
      t.column :crypted_password,          :string, :limit => 40
      t.column :salt,                      :string, :limit => 40
      t.column :created_at,                :datetime
      t.column :updated_at,                :datetime
      t.column :remember_token,            :string
      t.column :remember_token_expires_at, :datetime
      
      t.column :activation_code, :string,  :limit => 40
      t.column :activated_at,              :datetime
      t.column :password_reset_code,       :string, :limit => 40
      t.column :password_reseted_at,       :datetime
      t.column :pagado_at,                 :datetime
      t.column :tarifa_id,                 :integer
    end
  end

  def self.down
    drop_table "usuarios"
  end
end
