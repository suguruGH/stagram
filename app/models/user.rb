class User < ApplicationRecord
    #emailは小文字の意味            
        before_save { email.downcase! }
    #passwordを隠す    
        has_secure_password
        has_many :pictures
        # mount_uploader :image, ImageUploader 
        has_many :favorites, dependent: :destroy
        has_many :favorite_pictures, through: :favorites, source: :picture
        validates :name,  presence: true, length: { maximum: 30 }
        validates :email, presence: true, length: { maximum: 255 },
                format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }#唯一無二にする
  
         mount_uploader :image, ImageUploader
end
