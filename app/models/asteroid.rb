class Asteroid < ActiveRecord::Base
  has_many :mpcs
  has_many :calcs
end
