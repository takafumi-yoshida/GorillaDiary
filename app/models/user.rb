class User < ApplicationRecord

  has_many :diaries, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_diaries, through: :likes, source: :diary
  has_many :browsing_histories, dependent: :destroy
  has_many :history_diaries, through: :browsing_histories, source: :diary
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  validates :nickname, presence: true, uniqueness: true
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthabl
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def already_liked?(diary)
    self.likes.exists?(diary_id: diary.id)
  end

  def following?(writer)
    self.relationships.exists?(follow_id: writer.id)
  end

end
