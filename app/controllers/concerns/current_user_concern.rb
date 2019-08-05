module CurrentUserConcern
    extend ActiveSupport::Concern

    def current_user
        #if current_user is present, super returns
        #true, if not returns false and executes
        #the second condition
        super || guest_user
    end

    def guest_user
        OpenStruct.new(
            name: "Guest User",
            first_name: "Guest",
            last_name: "User",
            email: "guest@example.com"
            )
    end

end