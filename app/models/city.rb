class City < ApplicationRecord
    has_many :users

    # validates :name, :zip_code, presence: true
    validates :zip_code, length: {in:3..16}
end
