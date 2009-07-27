class CreateEmails < ActiveRecord::Migration
  def self.up
    create_table :emails do |t|
      t.column :recipients, :text
      t.column :from,       :string
      t.column :subject,    :text
      t.column :sent_on,    :datetime
      t.column :body,       :text
    end
  end

  def self.down
    drop_table :emails
  end
end
