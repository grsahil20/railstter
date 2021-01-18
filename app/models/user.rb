class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

	validates_presence_of :full_name, :username, :email
	validates_uniqueness_of :username, :email, case_sensitive: false

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
