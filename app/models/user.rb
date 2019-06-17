class User < ApplicationRecord
  has_many :fanfics, dependent: :destroy
  has_many :comments, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable, :validatable

  # attr_accessible  :username, :email, :password, :password_confirmation, :remember_me
end
