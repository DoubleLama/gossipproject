class User < ApplicationRecord
    has_secure_password
    belongs_to :city, optional: true
    has_many :gossips, dependent: :destroy
    has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
    has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
  
    validates :password, :email, presence: true
    validates :password, length: {minimum: 6}
    validates :description, length: {maximum: 500}
end
