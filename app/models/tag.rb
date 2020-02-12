class Tag < ApplicationRecord
    has_many :join_tag_gossips
    has_many :gossips, through: :join_tag_gossips
  
    validates :title, length: {maximum: 50}
end
