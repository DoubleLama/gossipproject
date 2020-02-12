class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :gossip
    has_many :likes
  
  
    validates :content, length: {maximum: 285}
end
