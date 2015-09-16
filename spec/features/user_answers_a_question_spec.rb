require 'rails_helper'

feature 'user submits a question', %Q{
  As a user
I want to answer another user's question
So that I can help them solve their problem
} do

# - I must be on the question detail page
# - I must provide a description that is at least 50 characters long
# - I must be presented with errors if I fill out the form incorrectly

  scenario 'user succesfully submits' do
    question = Question.create(body: "What makes the moon go around the earth go around the sun go around the polifon nexus go around...")
    visit "/questions/#{question.id}"
    description = "Bescause the world is round" * 9
    fill_in 'Description', with: description
    click_button 'Submit Answer'
    expect(page).to have_content("Well done")
    expect(page).to have_content(question.body)
    expect(page).to have_content("Answers:")
    expect(page).to have_content(description)
    expect(page).to have_link("EDIT QUESTION")
  end

  scenario 'description is too short' do
    question = Question.create(body: "What makes the moon go around the earth go around the sun go around the polifon nexus go around...")
    visit "/questions/#{question.id}"
    description = "See above. "
    fill_in 'Description', with: description
    click_button 'Submit Answer'
    expect(page).to have_content("Description is too short (minimum is 50 characters)")
  end
end
