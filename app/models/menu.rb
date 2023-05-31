class Menu < ApplicationRecord
    belongs_to :restaurant
    has_many_attached :pictures
end
