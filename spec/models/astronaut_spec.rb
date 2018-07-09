require 'rails_helper'

describe Astronaut, type: :model do
  describe 'relationships' do
    it {should have_many(:astronaut_space_missions)}
    it {should have_many(:space_missions).through(:astronaut_space_missions)}
  end

  describe 'calculations' do
    it 'finds average age of astronauts' do
      astronaut_1 = Astronaut.create(name: "Buzz Lightyear of Star Command", age: 10, job: "Defender of Peace in Space!")
      astronaut_2 = Astronaut.create(name: "Warp Darkmatter", age: 20, job: "Little is known about this mysterious alien")

      expected_result = 15

      expect(Astronaut.average_age).to eq(expected_result)
    end
    it 'finds an astronaut total time in space' do
      astronaut_1 = Astronaut.create(name: "Buzz Lightyear of Star Command", age: 10, job: "Defender of Peace in Space!")
      mission_1 = SpaceMission.create!(title: 'Blow up the Death Star', trip_length: 5)
      mission_2 = SpaceMission.create!(title: 'Eat Cereal', trip_length: 10)
      mission_3 = SpaceMission.create!(title: 'Win a space pie-eating contest', trip_length: 15)
      AstronautSpaceMission.create!(astronaut_id: astronaut_1.id, space_mission_id: mission_1.id)
      AstronautSpaceMission.create!(astronaut_id: astronaut_1.id, space_mission_id: mission_2.id)
      AstronautSpaceMission.create!(astronaut_id: astronaut_1.id, space_mission_id: mission_3.id)
      result = 30

      expect(astronaut_1.total_time_in_space).to eq(30)
    end
  end
end
