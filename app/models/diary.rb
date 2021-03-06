class Diary < ApplicationRecord
  belongs_to :user
  belongs_to :datetime
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_diaries, through: :likes, source: :user
  has_many :browsing_histories, dependent: :destroy
  has_many :history_diaries, through: :browsing_histories, source: :user
  validates :content, presence: true
  validates :title, presence: true, length: { maximum: 20 }
  validates_uniqueness_of :datetime_id, scope: :user_id
end
