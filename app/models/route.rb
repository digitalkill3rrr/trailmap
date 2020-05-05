class Route < ApplicationRecord
  mount_uploader :cover, CoverUploader

  belongs_to :collection, optional: true
  belongs_to :user
  has_many :spots
  has_many :comments

  accepts_nested_attributes_for :spots, allow_destroy: true

  validates :title, :description, :difficulty, :season, :distance, :kind, :cover, :track, presence: true

  # route info
  enum difficulty: [ 'лёгкий', 'средний', 'сложный' ]
  enum season: [ 'лето', 'осень', 'зима', 'весна' ]
  enum kind: [ 'пеший', 'вело' ]
end
