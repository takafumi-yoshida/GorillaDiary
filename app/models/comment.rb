class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :diary
  validates :content, presence: true, length: { maximum: 200 }
end
