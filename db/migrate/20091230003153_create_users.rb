class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      t.string   "email"
      t.string   "first_name"
      t.string   "last_name"
      t.string   "encrypted_password", :limit => 128
      t.string   "salt",               :limit => 128
      t.string   "confirmation_token", :limit => 128
      t.string   "remember_token",     :limit => 128
      t.boolean  "email_confirmed",                   :default => false, :null => false
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "customer_id"
      t.integer  "subscription_id"
    end

    add_index "users", ["email"], :name => "index_users_on_email"
    add_index "users", ["id", "confirmation_token"], :name => "index_users_on_id_and_confirmation_token"
    add_index "users", ["remember_token"], :name => "index_users_on_remember_token"
  end

  def self.down
    drop_table :users    
  end
end
