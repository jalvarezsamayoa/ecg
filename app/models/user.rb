class User < ActiveRecord::Base
   # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable,
  # :timeoutable and :omniauthable
  
#  devise :database_authenticatable, :registerable,
 #      :recoverable, :rememberable, :confirmable, :validatable
  devise :database_authenticatable, :validatable
  
   # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  
  validates_length_of       :name,     :maximum => 100
  
end
# == Schema Information
#
# Table name: users
#
#  id                     :integer(4)      not null, primary key
#  login                  :string(40)
#  name                   :string(100)     default("")
#  email                  :string(100)
#  encrypted_password     :string(128)     default(""), not null
#  password_salt          :string(255)     default(""), not null
#  created_at             :datetime
#  updated_at             :datetime
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer(4)      default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  failed_attempts        :integer(4)      default(0)
#  unlock_token           :string(255)
#  locked_at              :datetime
#  authentication_token   :string(255)
#

