class Comment < ApplicationRecord
  belongs_to :route
  belongs_to :user

  validates :user_id, :body, presence: true
end
