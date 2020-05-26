class User < ApplicationRecord
  has_many :routes
  has_many :spots
  has_many :comments
  has_many :collections
  has_many :reports

  enum role: [ :admin, :content, :user, :guest ]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
