class Attachment < ActiveRecord::Base
  belongs_to :note
  has_attached_file :phile
end
