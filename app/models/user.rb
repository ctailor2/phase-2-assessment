class User < ActiveRecord::Base
  has_many :event_attendances
  has_many :attended_events, :through => :event_attendances, :source => :event
  has_many :created_events, :class_name => "Event"


  has_secure_password
  validates :email, :presence => true
  validates :email, :uniqueness => true
  validates :email, :format => {:with => /\w+@\w+\.\w+/, :message => "must be of the format * @ * . *"}
end
