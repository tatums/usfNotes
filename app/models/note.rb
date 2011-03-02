class Note < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  has_many :events, :dependent => :destroy
  has_many :attachments, :dependent => :destroy
end
