class Picture < ApplicationRecord
    belongs_to :user
    has_many :favorites, dependent: :destroy
    has_many :favorite_users, through: :favorites, source: :user
    validates :content, :title, presence: true
    validates :content, length: { in: 1..140 }
    mount_uploader :image, ImageUploader
end
