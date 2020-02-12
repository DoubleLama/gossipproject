class JoinTagGossip < ApplicationRecord
    belongs_to :tag, optional:true
    belongs_to :gossip
end
