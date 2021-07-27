class Ride < ApplicationRecord
    belongs_to :user
    belongs_to :attraction

    def take_ride
        case 
        when attraction.tickets > user.tickets && attraction.min_height > user.height
            "Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the Roller Coaster."
        when attraction.tickets > user.tickets
            "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        when attraction.min_height > user.height
            "Sorry. You are not tall enough to ride the #{attraction.name}."
        else
            # byebug
            user.tickets -= attraction.tickets
            user.nausea += attraction.nausea_rating
            user.happiness += attraction.happiness_rating
            user.save
            "Thanks for riding the #{attraction.name}!"
        end

    end
end
