class Route < ApplicationRecord
  mount_uploader :cover, CoverUploader
  belongs_to :collection, optional: true
  belongs_to :user
  has_many :spots
  has_many :comments
  validates :user_id, :title, presence: true


  # route info
  enum difficulty: [ 'лёгкий', 'средний', 'сложный' ]
  enum season: [ 'лето', 'осень', 'зима', 'весна' ]
  enum kind: [ 'пеший', 'вело' ]

end
