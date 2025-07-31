class Room < ApplicationRecord
    belongs_to :hotel

    enum :room_type, {
        single: "single",
        double: "double",
        deluxe: "deluxe"
    }
end
