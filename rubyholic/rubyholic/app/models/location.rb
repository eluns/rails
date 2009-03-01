class Location < ActiveRecord::Base
  has_many :events
  has_many :groups, :through => :events
  
  validates_presence_of :name, :longitude, :latitude
  validates_uniqueness_of :name
  validates_numericality_of :longitude, :latitude
end
