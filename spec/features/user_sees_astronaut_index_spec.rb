describe 'user sees all astronauts' do
  it "sees all astronauts' info" do
    astronaut_1 = Astronaut.create(name: "Buzz Lightyear of Star Command", age: 36, job: "Defender of Peace in Space!")
    astronaut_2 = Astronaut.create(name: "Warp Darkmatter", age: 340, job: "Little is known about this mysterious alien")

    visit '/astronauts'

    expect(page).to have_content(astronaut_1.name)
    expect(page).to have_content(astronaut_1.age)
    expect(page).to have_content(astronaut_1.job)
    expect(page).to have_content(astronaut_2.name)
    expect(page).to have_content(astronaut_2.age)
    expect(page).to have_content(astronaut_2.job)
  end
end
