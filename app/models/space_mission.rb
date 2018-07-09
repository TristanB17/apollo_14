class SpaceMission < ApplicationRecord
  validates_presence_of :title, :trip_length

  has_many :astronaut_space_missions
  has_many :astronauts, through: :astronaut_space_missions
end
