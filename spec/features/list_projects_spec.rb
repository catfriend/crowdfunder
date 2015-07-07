require 'spec_helper'

describe "Viewing the list of projects" do

  it "shows the projects stored in the database" do
    projectA = Project.create(name: "Documenting Mountain Gorillas",
                              description: "Photographing a family of mountain gorillas over the course of a year.",
                              target_pledge_amount: 100.00,
                              pledging_ends_on: 1.day.from_now,
                              website: "http://project-a.com")

    projectB = Project.create(name: "Filming dances of the Masai",
                              description: "Documenting on film the different dances of the Masai.",
                              target_pledge_amount: 30000.00,
                              pledging_ends_on: 1.week.from_now,
                              website: "http://project-b.com")

    projectC = Project.create(name: "Water Pump",
                              description: "Fund and install a water pump in a village in Kenya.",
                              target_pledge_amount: 5000.00,
                              pledging_ends_on: 1.month.from_now,
                              website: "http://project-c.com")

    visit projects_url

    expect(page).to have_text("3 Projects")
    expect(page).to have_text(projectA.name)
    expect(page).to have_text(projectB.name)
    expect(page).to have_text(projectC.name)

    expect(page).to have_text(projectA.description)
    expect(page).to have_text("$100.00")
    expect(page).to have_text("1 day remaining")
    expect(page).to have_text(projectA.website)
    expect(page).to have_selector("img[src$='#{projectA.image_file_name}']")
  end

  it "does not show a project that is no longer accepting pledges" do
  project = Project.new(project_attributes(pledging_ends_on: 1.day.ago))
  project.save

  visit projects_path

  expect(page).not_to have_text(project.name)
end

end