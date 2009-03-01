class Event < ActiveRecord::Base
  belongs_to :group
  belongs_to :location
  
  validates_presence_of :name
  validates_presence_of :end
  validates_presence_of :start
end
