class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_one_attached :image   

  has_many :restaurants
  has_many :reviews   
  
  def owner?
    has_role?(:owner)
  end
  
  def normal_user?
    has_role?(:normal_user)
  end 
end
