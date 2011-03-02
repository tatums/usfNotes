class Event < ActiveRecord::Base
  belongs_to :note
  
  has_event_calendar
  
end
