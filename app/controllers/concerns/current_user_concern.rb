module CurrentUserConcern
    extend ActiveSupport::Concern

    def current_user
        #if current_user is present, super returns
        #true, if not returns false and executes
        #the second condition
        super || guest_user
    end

    def guest_user
        guest = GuestUser.new
        guest.name = "Guest User"
        guest.first_name = "Guest"
        guest.last_name = "User"
        guest.email = "guest@example.com"
        return guest
    end

end