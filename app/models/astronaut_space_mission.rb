class AstronautSpaceMission < ApplicationRecord
  #should I validate the presence of foreign keys here?
  belongs_to :astronaut
  belongs_to :space_mission
end
