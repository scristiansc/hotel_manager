class Room < ApplicationRecord
    belongs_to :hotel
    has_many :bookings

    enum :room_type, {
        single: "single",
        double: "double",
        deluxe: "deluxe"
    }
end
