feature 'Create links' do

  scenario 'users can create a new link' do
    visit '/links/new'
    fill_in 'url', :with => "http://www.aol.com"
    fill_in 'title', :with => "AOL"
    click_button 'Submit'
    expect(page).to have_content "AOL"
  end

end