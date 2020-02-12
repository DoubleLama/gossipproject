class PrivateMessage < ApplicationRecord
    belongs_to :sender, class_name: "User"
    has_many :join_message_recipients
end
