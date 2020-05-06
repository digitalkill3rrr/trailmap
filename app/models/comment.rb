class Comment < ApplicationRecord
  belongs_to :route
  belongs_to :user

  validates :body, presence: true
end
