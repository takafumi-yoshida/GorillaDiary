class Diary < ApplicationRecord
  belongs_to :user
  belongs_to :datetime
  has_many :comments
  validates :title, :content, presence: true
end
