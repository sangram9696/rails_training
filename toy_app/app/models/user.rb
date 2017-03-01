class User < ApplicationRecord
  has_many :microposts
  validates :name,length: { maximum: 160 }, presence: true
  validates :email, length: { maximum: 64 },presence: true
  validates :address,length: { maximum: 256 }, presence: true
end
