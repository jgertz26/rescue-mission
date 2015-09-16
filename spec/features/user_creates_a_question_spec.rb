require 'rails_helper'

feature 'user submits a question', %Q{
  As a user
I want to post a question
So that I can receive help from others
} do

# - I must provide a title that is at least 40 characters long
# - I must provide a description that is at least 150 characters long
# - I must be presented with errors if I fill out the form incorrectly

  scenario 'user succesfully submits' do
    visit '/questions/new'
    body = "How long will this go ooooooooooooooooooooooooooooooooooooon?"
    description = "See above. " * 15
    fill_in 'Body', with: body
    fill_in 'Description', with: description
    click_button 'Submit Question'
    expect(page).to have_content("Well done")
    expect(page).to have_content(body)
    expect(page).to have_link("EDIT QUESTION")
  end

  scenario 'body is too short' do
    visit '/questions/new'
    body = "What of it m8?"
    description = "See above. " * 15
    fill_in 'Body', with: body
    fill_in 'Description', with: description
    click_button 'Submit Question'
    expect(page).to have_content("Body is too short (minimum is 40 characters)")
  end

  scenario 'description is too short' do
    visit '/questions/new'
    body = "What of it m888888888888888888888888888888888888?"
    description = "See above. "
    fill_in 'Body', with: body
    fill_in 'Description', with: description
    click_button 'Submit Question'
    expect(page).to have_content("Description is too short (minimum is 150 characters)")
  end

  scenario 'user succesfully submits with empty description' do
    visit '/questions/new'
    body = "How long will this go ooooooooooooooooooooooooooooooooooooon?"
    fill_in 'Body', with: body
    click_button 'Submit Question'
    expect(page).to have_content("Well done")
    expect(page).to have_content(body)
    expect(page).to have_link("EDIT QUESTION")
  end
end
