module EventsHelper
    def current_user?(users)
      users == current_user.id
    end
  
    def event_title
      Event.find_by(:title)
    end
  end