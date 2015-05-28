Given(/^a large ship in position: “(\d+):(\d+)”$/) do |row, col|
  pos = "#{row}:#{col}"

  select("Large Ship", from: "ship")
  select(pos, from: "position")
  click_button "Add Ship"
end

Given(/^I shoot to position “(\d+):(\d+)”$/) do |row, col|
  @pos = "#{row}:#{col}"

  select(@pos, from: "shoot_position")
  click_button "Shoot"
end

Then(/^I get hit$/) do
  expect(page).to have_content("#{@pos} Hit")
end

Then(/^I get water$/) do
  expect(page).to have_content("#{@pos} Water")
end

Then(/^I get sink$/) do
  expect(page).to have_content("#{@pos} Water")
end
