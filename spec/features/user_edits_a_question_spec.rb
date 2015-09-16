require 'rails_helper'

feature 'user edits a question', %Q{
  As a user
I want to edit a question
So that I can correct any mistakes or add updates
} do

  # - I must provide valid information
  # - I must be presented with errors if I fill out the form incorrectly
  # - I must be able to get to the edit page from the question details page

  scenario 'user edits successfully' do
    body = "What makes the moon go around the earth go around the sun go around the polifon nexus go around..."
    description = "Freaking gravity ya dingus" * 15
    question = Question.create(body: body, description: description)
    visit "/questions/#{question.id}/edit"
    expect(page).to have_content(body)
    expect(page).to have_content(description)
    expect(page).to have_link("DELETE QUESTION")
    new_body = "Charlie darliessdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsd?"
    fill_in 'Body', with: new_body
    click_button 'Update Question'
    expect(page).to have_content("Updated!")
    expect(page).to have_content(new_body)
    expect(page).to have_link("EDIT QUESTION")
  end

  scenario 'user edits stupidly' do
    body = "What makes the moon go around the earth go around the sun go around the polifon nexus go around..."
    description = "Freaking gravity ya dingus" * 15
    question = Question.create(body: body, description: description)
    visit "/questions/#{question.id}/edit"
    new_body = "Charlie darlies?"
    new_description = "doinky dork"
    fill_in 'Body', with: new_body
    fill_in 'Description', with: new_description
    click_button 'Update Question'
    expect(page).to have_content("Body is too short (minimum is 40 characters)")
    expect(page).to have_content("Description is too short (minimum is 150 characters)")
    expect(page).to have_link("DELETE QUESTION")
  end
end
