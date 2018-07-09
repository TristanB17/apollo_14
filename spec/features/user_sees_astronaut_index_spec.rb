require 'rails_helper'

describe 'user sees all astronauts' do
  it "astronauts' info" do
    astronaut_1 = Astronaut.create(name: "Buzz Lightyear of Star Command", age: 36, job: "Defender of Peace in Space!")
    astronaut_2 = Astronaut.create(name: "Warp Darkmatter", age: 340, job: "Little is known about this mysterious alien")

    visit astronauts_path

    expect(page).to have_content(astronaut_1.name)
    expect(page).to have_content(astronaut_1.age)
    expect(page).to have_content(astronaut_1.job)
    expect(page).to have_content(astronaut_2.name)
    expect(page).to have_content(astronaut_2.age)
    expect(page).to have_content(astronaut_2.job)
  end

  it 'sees average age' do
    astronaut_1 = Astronaut.create(name: "Buzz Lightyear of Star Command", age: 10, job: "Defender of Peace in Space!")
    astronaut_2 = Astronaut.create(name: "Warp Darkmatter", age: 20, job: "Little is known about this mysterious alien")
    expected_result = 15

    visit astronauts_path

    expect(page).to have_content(expected_result)
  end
end

describe 'user sees all astronaut missions' do
  it 'lists missions alphabetically' do
    astronaut_1 = Astronaut.create!(name: "Buzz Lightyear of Star Command", age: 10, job: "Defender of Peace in Space!")
    mission_1 = SpaceMission.create!(title: 'Blow up the Death Star', trip_length: 5)
    mission_2 = SpaceMission.create!(title: 'Eat Cereal', trip_length: 10)
    mission_3 = SpaceMission.create!(title: 'Win a space pie-eating contest', trip_length: 15)
    AstronautSpaceMission.create!(astronaut_id: astronaut_1.id, space_mission_id: mission_1.id)
    AstronautSpaceMission.create!(astronaut_id: astronaut_1.id, space_mission_id: mission_2.id)
    AstronautSpaceMission.create!(astronaut_id: astronaut_1.id, space_mission_id: mission_3.id)

    visit astronauts_path

    expect(page).to have_content(mission_1.title)
    expect(page).to have_content(mission_2.title)
    expect(page).to have_content(mission_3.title)
  end
  it 'lists total time astronaut has spent in space' do
    astronaut_1 = Astronaut.create!(name: "Buzz Lightyear of Star Command", age: 10, job: "Defender of Peace in Space!")
    mission_1 = SpaceMission.create!(title: 'Blow up the Death Star', trip_length: 5)
    mission_2 = SpaceMission.create!(title: 'Eat Cereal', trip_length: 10)
    mission_3 = SpaceMission.create!(title: 'Win a space pie-eating contest', trip_length: 15)
    AstronautSpaceMission.create!(astronaut_id: astronaut_1.id, space_mission_id: mission_1.id)
    AstronautSpaceMission.create!(astronaut_id: astronaut_1.id, space_mission_id: mission_2.id)
    AstronautSpaceMission.create!(astronaut_id: astronaut_1.id, space_mission_id: mission_3.id)
    (expected_result = 30)

    visit astronauts_path

    expect(page).to have_content(expected_result)
  end
end
