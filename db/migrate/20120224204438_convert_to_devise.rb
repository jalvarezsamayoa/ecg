class ConvertToDevise < ActiveRecord::Migration
  def up

    #encrypting passwords and authentication related fields
    rename_column :users, "crypted_password", "encrypted_password" rescue nil
    change_column :users, "encrypted_password", :string, :limit => 128, :default => "", :null => false rescue nil
    rename_column :users, "salt", "password_salt" rescue nil
    change_column :users, "password_salt", :string, :default => "", :null => false rescue nil

    remove_column :users, :remember_token rescue nil
    remove_column :users, :remember_token_expires_at rescue nil


    ## Recoverable
    add_column :users, :reset_password_token, :string rescue nil
    add_column :users, :reset_password_sent_at, :datetime rescue nil

    ## Rememberable
    add_column :users, :remember_created_at, :datetime rescue nil

    ## Trackable
    add_column :users, :sign_in_count, :integer, :default => 0 rescue nil
    add_column :users,  :current_sign_in_at, :datetime rescue nil
    add_column :users, :last_sign_in_at, :datetime rescue nil
    add_column :users,  :current_sign_in_ip, :string rescue nil
    add_column :users,  :last_sign_in_ip, :string rescue nil

    ## Confirmable
    add_column :users, :confirmation_token, :string rescue nil
    add_column :users, :confirmed_at, :datetime  rescue nil
    add_column :users, :confirmation_sent_at, :datetime rescue nil
    add_column :users, :unconfirmed_email, :string rescue nil # Only if using reconfirmable

    ## Lockable
    add_column :users, :failed_attempts, :integer, :default => 0 rescue nil # Only if lock strategy is :failed_attempts
    add_column :users, :unlock_token, :string rescue nil # Only if unlock strategy is :email or :both
    add_column :users, :locked_at, :datetime rescue nil

    ## Token authenticatable
    add_column :users, :authentication_token, :string rescue nil

    #-------------------------------------


    add_index :users, :email,                :unique => true rescue nil
    add_index :users, :reset_password_token, :unique => true rescue nil
    add_index :users, :confirmation_token,   :unique => true rescue nil
    add_index :users, :unlock_token,         :unique => true rescue nil
    add_index :users, :authentication_token, :unique => true rescue nil

     
  end

  def down
    #rememberme related fields
    remove_column :users, "remember_created_at"

    #reset password related fields
    rename_column :users, "reset_password_token", "password_reset_code"

    #confirmation related fields
    rename_column :users, "confirmation_token", "activation_code"
    rename_column :users, "confirmed_at", "activated_at"
    change_column :users, "activation_code", :string
    remove_column :users, "confirmation_sent_at"

    #encrypting passwords and authentication related fields
    rename_column :users, "encrypted_password", "crypted_password"
    change_column :users, "crypted_password", :string, :limit => 40
    rename_column :users, "password_salt", "salt"
    change_column :users, "salt", :string, :limit => 40


    add_column :users, :remember_token, :string
    add_column :users, :remember_token_expires_at, :datetime   


    ## Trackable
    remove_column :users, :sign_in_count, :integer, :default => 0
    remove_column :users,  :current_sign_in_at, :datetime
    remove_column :users, :last_sign_in_at, :datetime
    remove_column :users,  :current_sign_in_ip, :string
    remove_column :users,  :last_sign_in_ip, :string

    ## Confirmable
    remove_column :users, :confirmation_token, :string
    remove_column :users, :confirmed_at, :datetime
    remove_column :users, :confirmation_sent_at, :datetime
    remove_column :users, :unconfirmed_email, :string # Only if using reconfirmable

    ## Lockable
    remove_column :users, :failed_attempts, :integer, :default => 0 # Only if lock strategy is :failed_attempts
    remove_column :users, :unlock_token, :string # Only if unlock strategy is :email or :both
    remove_column :users, :locked_at, :datetime

    ## Token authenticatable
    remove_column :users, :authentication_token, :string


  end
end
