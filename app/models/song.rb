class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :purchases, dependent: :destroy
  has_many :users, through: :purchases

  validates :artist, presence: true
  validates :title, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0}

end