class User < ActiveRecord::Base
  has_many :todos
  has_many :favorites
  has_many :favorite_todos, through: :favorites

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
