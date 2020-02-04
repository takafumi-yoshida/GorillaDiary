class User < ApplicationRecord

  has_many :diaries
  has_many :comments

  validates :nickname, presence: true, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthabl
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
