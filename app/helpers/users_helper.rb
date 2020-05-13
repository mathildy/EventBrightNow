module UsersHelper

    def current_user?(users)
        users == current_user.id
      end
end
